# Contributing

## Layout

- `samples/cookbooks/<name>`: one cookbook each, named `gusztavvargadr_<name>`, with its policies, `kitchen.yml`, and pipeline.
- `src`: the shared policy helpers every policy requires, and the Test Kitchen configuration of each driver.
- `src/bootstrap`: the bootstrap scripts, the `Vagrantfile` that tests them, and their pipeline.

## Cookbook conventions

- The `default` recipe runs `initialize`, `apply`, and `cleanup`, in that order.
- A cookbook reads its settings only from `node['gusztavvargadr_<name>']`.
- A cookbook knows nothing about the cookbooks that depend on it, the policies that use it, Test Kitchen, or the build.

`samples/cookbooks/hello-world` is a minimal sample of a cookbook that follows these conventions.

## Prerequisites

- The .NET SDK, to run [Cake](https://cakebuild.net).
- Chef Workstation. On Windows, `build.cake` expects it under `C:\opscode\chef-workstation`.
- For acceptance with the `vagrant` driver, and for the bootstrap test: Vagrant and a provider, which `VAGRANT_DEFAULT_PROVIDER` selects and which is `virtualbox` when unset. The Windows boxes are amd64 only.
- For acceptance with the `ec2` driver, which is experimental: AWS credentials.

## Build and test

`build.cake` runs a target for one cookbook:

```sh
dotnet tool restore
dotnet cake --cookbook <cookbook> [--instance <instance>] [--driver <driver>] --target <target>
```

- `--cookbook` is a directory under `samples/cookbooks`, such as `docker`.
- `--instance` is a Test Kitchen instance, such as `default-ubuntu-2204`. Without it, a target acts on every instance.
- `--driver` is `vagrant` or `ec2`, and `vagrant` when left out. `ec2` is experimental: the AMIs `src/kitchen.ec2.yml` searches for are gone and are to be built with packer, and the pipelines use `vagrant` on the self-hosted agents.
- `--configuration <cookbook>/<instance>/<driver>` is a shortcut for the three, where trailing parts can be left out, such as `--configuration docker/default-ubuntu-2204`.
- `--showtree` in place of `--target` lists the targets.

### Commit

- `commit`, the default target, lints with Cookstyle, exports every policy of the cookbook, and runs its specs.
- `commit-lint-fix` corrects the lint offenses Cookstyle can correct by itself.

### Acceptance

- `acceptance` creates, converges, verifies, and destroys each instance with Test Kitchen. Converging installs [Cinc Client](https://cinc.sh) where the instance doesn't have it yet, because Chef Infra Client's packages need a Progress license.
- `acceptance-create`, `-converge`, `-verify`, `-test`, and `-login` each run the [Test Kitchen](https://kitchen.ci/docs/getting-started/) command of the same name, and `acceptance-clean` runs `kitchen destroy`.

### Bootstrap

- `bootstrap` tests `src/bootstrap` on VMs with the cookbook's archive, which `commit` or `commit-build` builds first. For each machine, it provisions the machine twice, the second time to show nothing is installed again, and then destroys it.
- `bootstrap-test` provisions without destroying, and `bootstrap-clean` runs `vagrant destroy`.
- `--instance` is a machine of `src/bootstrap/Vagrantfile`: `ubuntu`, `ubuntu-chef`, `windows`, or `windows-chef`. The `*-chef` machines have Chef Infra Client, and the test fails if Cinc Client gets installed next to it. Without `--instance`, a target acts on every machine.
- For example: `dotnet cake --cookbook hello-world --target commit-build`, then `dotnet cake --cookbook hello-world --instance ubuntu --target bootstrap`.

### Checks

- A cookbook: `commit` on it and on each cookbook that depends on it, then `acceptance` on the instances its pipeline lists.
- `src/Policyfile.rb`: `commit` on every cookbook.
- `src/kitchen.*`: `acceptance` on the driver and platforms it changes.
- `src/bootstrap`, or `src/kitchen.Vagrantfile`, which its `Vagrantfile` loads: `bootstrap` on `hello-world`, on every machine.

## Pipelines

The Azure Pipelines run on a push to any branch, and not on pull requests.

- Each cookbook's `azure-pipelines.yml` runs `commit` and then `acceptance` when its directory, or the directory of a cookbook it depends on, changes. A new cookbook adds one, and a new dependency adds that cookbook's directory to its path filter.
- `src/bootstrap/azure-pipelines.yml` tests and publishes the bootstrap scripts, and each cookbook's pipeline publishes its policy archives.
- Publishing goes to the release `latest` on `master`, and to the draft release `latest-draft` on other branches. It needs the service connection `github-releases`, which uses a GitHub token that can write this repository's contents.
- Publishing never deletes an asset. Delete a removed or renamed policy's archive from `latest` by hand.
- `src/Policyfile.rb` isn't in the cookbooks' path filters. After it changes, queue every cookbook pipeline on `master` to republish the archives.
- The first push of a new branch starts no pipeline when it carries more than one commit, although later pushes do. Push a new branch after its first commit, or queue by hand the pipelines its first push should have started.
