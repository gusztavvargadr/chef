# Architecture

This document describes the shape of the shared Chef cookbook library and the Chef Docker images as they stand, and what stays true of them as they change.

## Cookbooks

Each directory under `samples/cookbooks` is one cookbook, named `gusztavvargadr_<name>` in its `metadata.rb`, with its recipes, its policies, and its `kitchen.yml`. Every cookbook but `gusztavvargadr_hello_world` has `initialize`, `apply`, and `cleanup` recipes, which its `default` recipe runs in that order, and reads settings only from the node attribute of its own name, such as `node['gusztavvargadr_docker']`.

Most cookbooks depend on no other cookbook. These do:

| Cookbook | Depends on | How it uses them |
| --- | --- | --- |
| `gusztavvargadr_development` | `gusztavvargadr_git`, `gusztavvargadr_dotnet`, `gusztavvargadr_docker` | Its `initialize`, `apply`, and `cleanup` recipes run the recipe of the same name of each, and its policy sets their tools |
| `gusztavvargadr_iis` | `gusztavvargadr_windows` | Its resources install native installer packages with the `gusztavvargadr_windows_native_package` resource |
| `gusztavvargadr_visualstudio` | `gusztavvargadr_windows` | Its resources install native installer packages with the `gusztavvargadr_windows_native_package` resource |
| `gusztavvargadr_vagrant` | `gusztavvargadr_hashicorp` | Its `gusztavvargadr_vagrant_tool` resource installs and configures Vagrant with the `gusztavvargadr_hashicorp_tool` resource |
| `gusztavvargadr_hello_world` | `hello_world`, from the Chef Supermarket | Its `default` recipe runs `hello_world::default` |

A cookbook's recipes and resources know nothing about the cookbooks that depend on it, the policies that select its options, Test Kitchen, the build script, or the Docker images.

## Shared policy

`src/Policyfile.rb` is the code every policy requires before anything else. It defines:

- `gusztavvargadr_chef_sources`, which adds the Chef Supermarket and `samples/cookbooks`, found relative to `src`, as the policy's default sources
- `attributes`, which renders each YAML file it is given through ERB, deep merges them in order, and sets each top-level key as a default attribute of the policy
- `Hash#deep_merge`, which `attributes` merges with, merging nested hashes, uniting arrays, and keeping the earlier value where the later one is `nil`, `:nil`, or `:undefined`

Each `Policyfile*.rb` under `samples/cookbooks` requires it by the relative path `../../../src/Policyfile`, calls `gusztavvargadr_chef_sources`, runs the `default` recipe of its cookbook, and reads its options from the `.yml` file of the same name where it has one.

The Windows and Ubuntu policies of `gusztavvargadr/packer` require it too, through the `lib/gusztavvargadr/chef` submodule, and call `gusztavvargadr_chef_sources` to resolve these cookbooks next to their own. `src/Policyfile.rb` is a reserved path: moving or renaming it, or renaming `gusztavvargadr_chef_sources`, breaks `packer`, and so does moving `samples/cookbooks` away from where `gusztavvargadr_chef_sources` finds it.

The shared policy knows nothing about any one cookbook, Test Kitchen, or the Docker images.

## Shared Kitchen configuration

`src/kitchen.vagrant.yml` and `src/kitchen.ec2.yml` each hold one driver's configuration: the driver, the `chef_infra` provisioner with the Chef Infra Client version it installs, the InSpec verifier, and the platforms. The Vagrant one adds the `src/kitchen.Vagrantfile.erb` template and the `src/kitchen.Vagrantfile`, which sets the CPUs, memory, and nested virtualization of each Vagrant provider from environment variables.

`build.cake` runs Test Kitchen in the cookbook's directory with `KITCHEN_GLOBAL_YAML` set to `../../../src/kitchen.<driver>.yml`, where the driver is `vagrant` unless the configuration names another. The cookbook's `kitchen.yml` overrides it, and holds only the cookbook's suites and the provisioner's retries where the cookbook sets them. A suite names the policy it converges where it is not `Policyfile.rb`, the platforms it includes where it does not run on every one, and the attributes it sets.

The shared Kitchen configuration knows nothing about any one cookbook.

## Docker images

The images are built from the Dockerfiles under `build/docker/linux` and `build/docker/windows`, one per image, and are tagged `gusztavvargadr/<image>:<platform>-<variant>-<version>`. `docker-compose.yml` names each image that way, from the platform, variant, version, and base image in an `.env.<platform>-<variant>-<version>` file.

| Image | Built from | Adds |
| --- | --- | --- |
| `gusztavvargadr/chef-core` | `mcr.microsoft.com/dotnet/sdk` on Linux, `mcr.microsoft.com/windows/<variant>` on Windows | Locales and curl on Linux and Chocolatey on Windows, from the `chef-core` install script under `build/chef`, and `CHEF_LICENSE=accept-silent` |
| `gusztavvargadr/chef-client` | `gusztavvargadr/chef-core` of the same platform, variant, and version | Chef Infra Client, at the version the `chef-client` install script under `build/chef` pins |
| `gusztavvargadr/chef-workstation` | `gusztavvargadr/chef-core` of the same platform, variant, and version | Chef Workstation, at the version the `chef-workstation` install script under `build/chef` pins, and Git |

The pipeline under `build/docker` runs each `chef-client` and `chef-workstation` build after the `chef-core` build of the same platform, for Ubuntu 22.04 and 24.04, and its Windows platforms are commented out. Where it publishes, it pushes each tag and a `latest` manifest of each image's tags to Docker Hub.

The images copy only the install scripts under `build/chef`, and know nothing about the cookbooks or the shared policy.

## Invariants

- Every `Policyfile*.rb` under `samples/cookbooks` requires `src/Policyfile.rb` and calls `gusztavvargadr_chef_sources`.
- `src/Policyfile.rb` stays at that path, and its `gusztavvargadr_chef_sources` keeps resolving the cookbooks under `samples/cookbooks`, because `packer` requires it through its `lib/gusztavvargadr/chef` submodule.
- A cookbook runs a recipe of, uses a resource of, or reads a node attribute of another cookbook only where its `metadata.rb` depends on that cookbook.
- No cookbook depends on a cookbook that depends on it.
- No cookbook's `kitchen.yml` names a driver or a verifier, or defines a platform, because those come from `src/kitchen.<driver>.yml`.
- The `chef-client` and `chef-workstation` Dockerfiles build `FROM` the `gusztavvargadr/chef-core` image of the same platform, variant, and version.
- No Docker image copies a cookbook or `src`.
