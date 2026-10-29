# Engineering

This document describes how the shared Chef cookbook library and the Chef Docker images are built, tested, and checked, and how a change to them is proven.

## Environment

A machine that builds and tests the cookbooks needs:

- the .NET SDK, to restore and run Cake with `dotnet tool restore` and `dotnet cake`
- Chef Workstation, for `chef`, `cookstyle`, `rspec`, and `kitchen`, installed on Windows under `C:\opscode\chef-workstation`, because `build.cake` runs `kitchen.bat` from its `bin` there
- for acceptance with the `vagrant` driver, Vagrant and one of the providers `src/kitchen.Vagrantfile` configures, `hyperv`, `libvirt`, `virtualbox`, or `vmware_desktop`, which `VAGRANT_DEFAULT_PROVIDER` selects and which is `virtualbox` where it is unset
- for acceptance with the `ec2` driver, AWS credentials that can launch instances in `eu-west-1` from the images `src/kitchen.ec2.yml` searches for

Vagrant downloads the `gusztavvargadr/kitchen-<platform>` box of each platform the first time it creates one. `src/kitchen.Vagrantfile` sizes each machine from `VAGRANT_PROVIDER_CPUS` and `VAGRANT_PROVIDER_MEMORY`, 4 CPUs and 8192 MB where they are unset.

A machine that builds the images needs Docker with Compose.

The repository pins no version of the .NET SDK, Chef Workstation, or Vagrant on the machine. It pins these:

| What | Pinned in |
| --- | --- |
| Cake | `.config/dotnet-tools.json` |
| Chef Infra Client on the machines Kitchen creates | `src/kitchen.vagrant.yml`, `src/kitchen.ec2.yml` |
| Chef Infra Client in the `chef-client` image | `build/chef/linux/chef-client.install.sh`, `build/chef/windows/chef-client.install.ps1` |
| Chef Workstation in the `chef-workstation` image | `build/chef/linux/chef-workstation.install.sh`, `build/chef/windows/chef-workstation.install.ps1` |
| The base image of `chef-core` | The `.env.<platform>-<variant>-<version>` files, and `build/docker/azure-pipelines.yml` |

## Operations

`build.cake` is the one entry point for the cookbooks. Restore Cake, then run a target for a configuration:

```sh
dotnet tool restore
dotnet cake --configuration <cookbook>/<instance>/<driver> --target <target>
```

- `<cookbook>` is a directory under `samples/cookbooks`, such as `docker`.
- `<instance>` is a Kitchen instance, `<suite>-<platform>`, such as `default-ubuntu-2204`. Without it, Kitchen acts on every instance of the cookbook, and `acceptance-login` needs one.
- `<driver>` is `vagrant` or `ec2`, `vagrant` where it is left out, and selects `src/kitchen.<driver>.yml`.
- Without `--target`, Cake runs `default`, which is `commit`.

`build.cake` reads the cookbook before anything else, so it needs a configuration even to say what it offers. Its targets have no descriptions, and it lists them with the targets each one runs first:

```sh
dotnet cake --configuration hello-world --showtree
```

Every target runs its commands in the cookbook's directory:

| Target | What it runs |
| --- | --- |
| `commit-init` | `chef --version` |
| `commit-lint` | `chef exec cookstyle` |
| `commit-lint-fix` | `chef exec cookstyle --autocorrect` |
| `commit-build` | `chef install`, `chef update --attributes`, and `chef export --archive` for each `Policyfile*.rb`, leaving `artifacts/<policy name>.tgz` |
| `commit-test` | `chef exec rspec` |
| `commit-clean` | Empties `artifacts` |
| `commit` | `commit-init`, `commit-lint`, `commit-build`, and `commit-test` |
| `acceptance-init` | `chef --version`, `kitchen --version`, and `kitchen list` |
| `acceptance-create`, `acceptance-converge`, `acceptance-verify`, `acceptance-test`, `acceptance-login` | `kitchen create`, `converge`, `verify`, `test`, or `login` |
| `acceptance-clean` | `kitchen destroy` |
| `acceptance` | `acceptance-init` and `acceptance-test` |
| `all` | `commit` and `acceptance` |

`Policyfile*.lock.json` is ignored rather than committed, so `commit-build` in a clean clone, as in the pipelines, resolves each policy's cookbooks afresh.

`build.cake` does not build the images: `docker-compose.yml` builds and runs each Linux image for the platform an `.env.linux-<variant>-<version>` file names. Building the Windows images with `docker-compose.yml` is not supported.

## Checks

| Change | Check |
| --- | --- |
| A cookbook | `commit` of the cookbook and of each cookbook that depends on it, and `acceptance` on the instances its pipeline lists |
| `src/Policyfile.rb` | `commit` of every cookbook |
| `src/kitchen.*` | `acceptance` on the driver and platforms it changes |
| An image, or its install script under `build/chef` | Building and running the image and each image built on it |
| Only `README.md` or the guides | None, and the text is read against the repository |

A cookbook is checked with:

```sh
dotnet cake --configuration docker --target commit
dotnet cake --configuration docker/default-ubuntu-2204 --target acceptance
```

`commit-lint-fix` corrects the offenses Cookstyle can correct by itself. `commit-test` finds no examples and passes, because no cookbook has a `spec` directory. What a cookbook installs is proven in acceptance instead, by the InSpec tests under its `test/integration/<suite>`, for every cookbook but `gusztavvargadr_hello_world`, whose `hello-world` directory has no `test` directory.

An image is checked by building and running it, `chef-core` first, so `chef-client` and `chef-workstation` build on the changed `chef-core` rather than on the published one:

```sh
docker compose --env-file .env.linux-ubuntu-22.04 build chef-core
docker compose --env-file .env.linux-ubuntu-22.04 run --rm chef-core
```

`chef-client` and `chef-workstation` are built and run the same way, after it.

Running a Linux image prints `uname -a` for `chef-core`, `chef-client --version` for `chef-client`, and `chef --version` for `chef-workstation`.

The pipelines run the same checks on Azure Pipelines, on a push to any branch, and not on pull requests:

- Each cookbook's `azure-pipelines.yml` runs on a push that changes its directory or the directory of a cookbook it depends on. Its commit stage runs `commit` and publishes `artifacts` as a pipeline artifact named after the cookbook, on an agent of the self-hosted `default` pool whose `VSTS_AGENT_CAP_CHEF` capability is `build`. Its acceptance stage then runs `acceptance` with the `vagrant` driver for each instance the pipeline lists, and `acceptance-clean` after it whether it passed or not, on an agent of the same pool whose `VSTS_AGENT_CAP_CHEF` capability is `test` and that has a `VSTS_AGENT_CAP_VIRTUALIZATION_PROVIDER` capability. The jobs run directly on those agents, not in the Docker images.
- `build/docker/azure-pipelines.yml` runs on a push that changes `build/docker` or `build/chef`, on Microsoft-hosted agents. It builds and runs each image for each platform, and publishes it only on `master`, or when it is run with its `Force Publish` parameter.

A change to `src`, `build.cake`, `samples/cookbooks/azure-pipelines.stages.yml`, `docker-compose.yml`, or the `.env.*` files starts no pipeline, so its checks run locally. `master` requires no status check.

## Escalation

Ask the maintainer before running:

- `acceptance-create`, `acceptance-converge`, `acceptance-verify`, `acceptance-test`, `acceptance`, or `all`, because each creates machines: with `vagrant`, it downloads boxes and starts virtual machines on the machine that runs it, and with `ec2`, it launches `c7i.xlarge` spot instances in AWS that cost money until they are destroyed. Without an instance, it creates a machine for every instance of the cookbook. Each machine stays until a passing `acceptance-test` or `acceptance-clean` destroys it.
- `docker compose push`, or the image pipeline with its `Force Publish` parameter, because it replaces the images on Docker Hub that consumers pull.

The commit targets and `acceptance-init` create no machine and publish nothing, so they need no approval.

## Cookbook pipelines

Each cookbook has its own `azure-pipelines.yml`, which passes its name and the instances to accept to `samples/cookbooks/azure-pipelines.stages.yml`, and whose path filter lists its own directory and the directory of each cookbook under `samples/cookbooks` it depends on. A new cookbook adds one, and a new dependency adds that cookbook's directory to the filter.
