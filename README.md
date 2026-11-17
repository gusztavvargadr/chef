# chef

[Chef](https://www.chef.io) cookbooks for provisioning Windows and Ubuntu machines: Docker, .NET, Git, IIS, Visual Studio, HashiCorp tools, VirtualBox, Vagrant, Azure Pipelines agents, and operating system setup.

The cookbooks live under `samples/cookbooks`, a path kept for historical reasons. The Chef Docker images under `build/docker` and the Chocolatey package under `build/chocolatey` are not maintained and are pending removal.

## Requirements

- [Chef Workstation](https://docs.chef.io/workstation/), to resolve and export a policy.
- Chef Infra Client 18 or later on each machine a policy provisions.

## Usage

Get a copy of this repository wherever your policies can reach it. A policy requires `src/Policyfile.rb` from it, calls `gusztavvargadr_chef_sources` so the cookbooks resolve from this repository and the Chef Supermarket, and passes its options to `attributes`:

```ruby
require "<path to chef>/src/Policyfile"

name 'docker_host'

gusztavvargadr_chef_sources

run_list(
  'recipe[gusztavvargadr_docker::default]'
)

attributes(
  [
    "#{File.dirname(__FILE__)}/Policyfile.yml",
  ]
)
```

The options file has one top-level key per cookbook, and under it the options to install:

```yaml
gusztavvargadr_docker:
  tools:
    engine:latest-community:
```

- A cookbook's options and their defaults are in its `attributes/options.rb`. An option left empty installs with those defaults, and a value set under it replaces the default of the same key.
- `attributes` renders each file through ERB, then merges the files in order: nested hashes merge, arrays unite, and a later `nil`, `:nil`, or `:undefined` keeps the earlier value.
- To add cookbooks of your own, add their directory as another source after `gusztavvargadr_chef_sources`, and depend on these cookbooks in their `metadata.rb`.

Every cookbook has version `0.0.0`, so the commit of this repository you use is the version.

Resolve, export, and run the policy as the [Policyfile documentation](https://docs.chef.io/policyfile/) describes.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
