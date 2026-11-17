# chef

[Chef](https://www.chef.io) cookbooks for provisioning Windows and Ubuntu environments.

The cookbooks live under `samples/cookbooks`, a path kept for historical reasons. The Chef Docker images under `build/docker` are not maintained and are pending removal.

## Requirements

- [Chef Workstation](https://docs.chef.io/workstation/), to resolve and export a policy.
- Chef Infra Client 18 or later on each machine a policy provisions.

## Usage

Get a copy of this repository wherever your policies can reach it. A policy requires `src/Policyfile.rb` from it, calls `gusztavvargadr_chef_sources` so the cookbooks resolve from this repository and the Chef Supermarket, and passes its options to `attributes`:

```ruby
require "#{File.dirname(__FILE__)}/<path to chef>/src/Policyfile"

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

The options file has one top-level key per cookbook, and under it the collections the cookbook installs, such as `tools`:

```yaml
gusztavvargadr_docker:
  tools:
    engine:latest-community:
```

- A cookbook's `attributes/default.rb` lists the collections it reads, and its `attributes/options.rb`, where it has one, lists the options and their defaults. An option left empty installs with those defaults, and a value set under it replaces the default of the same key.
- `attributes` renders each file through ERB, then merges the files in order: nested hashes merge, arrays unite, and a later `nil`, `:nil`, or `:undefined` keeps the earlier value.
- To add cookbooks of your own, add their directory as another source after `gusztavvargadr_chef_sources`, and depend on these cookbooks in their `metadata.rb`.

Every cookbook has version `0.0.0`, so the commit of this repository you use is the version.

Resolve, export, and run the policy as the [Policyfile documentation](https://docs.chef.io/policyfile/) describes. Two things to know:

- The options are stored in the policy's lock file, so after changing an options file, run `chef update --attributes` before exporting.
- Where a run leaves a reboot pending, the cookbook's `cleanup` recipe reboots the machine and the run exits non-zero. Run it again until it exits 0.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
