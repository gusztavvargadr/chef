# Contributing

## Layout

- `samples/cookbooks/<name>`: one cookbook each, named `gusztavvargadr_<name>`, with its policies, `kitchen.yml`, and pipeline.
- `src`: the shared policy helpers every policy requires, and the Test Kitchen configuration of each driver.

## Cookbook conventions

- The `default` recipe runs `initialize`, `apply`, and `cleanup`, in that order.
- A cookbook reads its settings only from `node['gusztavvargadr_<name>']`.
- A cookbook knows nothing about the cookbooks that depend on it, the policies that use it, Test Kitchen, or the build.

`samples/cookbooks/hello-world` is a minimal sample of a cookbook that follows these conventions.

## Prerequisites

- The .NET SDK, to run [Cake](https://cakebuild.net).
- Chef Workstation. On Windows, `build.cake` expects it under `C:\opscode\chef-workstation`.
- For acceptance with the `vagrant` driver: Vagrant and a provider, which `VAGRANT_DEFAULT_PROVIDER` selects and which is `virtualbox` when unset.
- For acceptance with the `ec2` driver: AWS credentials.

## Build and test

`build.cake` runs a target for one cookbook:

```sh
dotnet tool restore
dotnet cake --cookbook <cookbook> [--instance <instance>] [--driver <driver>] --target <target>
```

- `--cookbook` is a directory under `samples/cookbooks`, such as `docker`.
- `--instance` is a Test Kitchen instance, such as `default-ubuntu-2204`. Without it, a target acts on every instance.
- `--driver` is `vagrant` or `ec2`, and `vagrant` when left out.
- `--configuration <cookbook>/<instance>/<driver>` is a shortcut for the three, where trailing parts can be left out, such as `--configuration docker/default-ubuntu-2204`.
- `--showtree` in place of `--target` lists the targets.

### Commit

- `commit`, the default target, lints with Cookstyle, exports every policy of the cookbook, and runs its specs.
- `commit-lint-fix` corrects the lint offenses Cookstyle can correct by itself.

### Acceptance

- `acceptance` creates, converges, verifies, and destroys each instance with Test Kitchen.
- `acceptance-create`, `-converge`, `-verify`, `-test`, and `-login` each run the [Test Kitchen](https://kitchen.ci/docs/getting-started/) command of the same name, and `acceptance-clean` runs `kitchen destroy`.

### Checks

- A cookbook: `commit` on it and on each cookbook that depends on it, then `acceptance` on the instances its pipeline lists.
- `src/Policyfile.rb`: `commit` on every cookbook.
- `src/kitchen.*`: `acceptance` on the driver and platforms it changes.

## Pipelines

The Azure Pipelines run on a push to any branch, and not on pull requests.

- Each cookbook's `azure-pipelines.yml` runs `commit` and then `acceptance` when its directory, or the directory of a cookbook it depends on, changes. A new cookbook adds one, and a new dependency adds that cookbook's directory to its path filter.
- The first push of a new branch starts no pipeline when it carries more than one commit, although later pushes do. Push a new branch after its first commit, or queue by hand the pipelines its first push should have started.
