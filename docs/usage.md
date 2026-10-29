# Usage

This document describes how to install and use the shared Chef cookbook library in a Chef policy of another repository, the way [`gusztavvargadr/packer`](https://github.com/gusztavvargadr/packer) does.

## Install

1. Install Chef Workstation on the machine that resolves and exports the policies:

   ```sh
   curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chef-workstation
   ```

   ```powershell
   . { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project chef-workstation
   ```

2. Add the repository as a submodule of the consuming repository, at `lib/gusztavvargadr/chef` as `packer` does:

   ```sh
   git submodule add https://github.com/gusztavvargadr/chef.git lib/gusztavvargadr/chef
   ```

3. Clone the consuming repository with its submodules, or initialize them in a clone that has none:

   ```sh
   git clone --recurse-submodules <repository>
   git submodule update --init
   ```

4. Install Chef Infra Client 18 or later, which every cookbook requires, on each machine a policy provisions, with the commands of step 1, because Chef Workstation includes it. `packer` installs Chef Infra Client 18.10.17 alone instead, with `-P chef -v 18.10.17`, which omnitruck serves only with a Progress Chef license.

Every cookbook has version `0.0.0`, so the commit the submodule pins is what tells one version of the cookbooks from another.

## Use

A policy requires `src/Policyfile.rb` from the submodule, calls `gusztavvargadr_chef_sources` so the cookbooks resolve from the submodule and the Chef Supermarket, runs the recipes it needs, and passes its options to `attributes`:

```ruby
require "#{File.dirname(__FILE__)}/lib/gusztavvargadr/chef/src/Policyfile"

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

The options file has one top-level key per cookbook, the cookbook's name, and under it the collections the cookbook installs, such as `tools`:

```yaml
gusztavvargadr_docker:
  tools:
    engine:latest-community:
```

- Each key under `tools` names an option the cookbook defines in its `attributes/options.rb`.
- Left empty, the tool installs with the defaults that file gives it, and a value set under it replaces the default of the same key.
- `attributes` takes several files, and a later file adds to and overrides what an earlier one sets.

A consumer with cookbooks of its own adds them as another source after `gusztavvargadr_chef_sources`, and its cookbooks use the recipes and resources of these cookbooks by depending on them in their `metadata.rb`, as `packer`'s `gusztavvargadr_packer_windows` depends on `gusztavvargadr_windows`:

```ruby
gusztavvargadr_chef_sources
default_source :chef_repo, "#{File.dirname(__FILE__)}/cookbooks"
```

Resolve the policy and export it to a directory, in the directory of its `Policyfile.rb`:

```sh
chef install --chef-license accept-silent
chef update --attributes
chef export <directory> --force
```

Copy the directory to the machine, and run Chef Infra Client in it in local mode:

```sh
sudo CHEF_LICENSE=accept-silent chef-client --local-mode
```

```powershell
$env:CHEF_LICENSE = "accept-silent"
chef-client --local-mode --config-option cookbook_sync_threads=1
```

`packer` syncs cookbooks in one thread on Windows, because Chef Infra Client 18.10.17 races while exporting Windows certificate keys during a parallel cookbook sync.

Where a run leaves a reboot pending, such as after installing updates or a Windows feature, the `cleanup` recipe of `gusztavvargadr_docker`, `gusztavvargadr_hashicorp`, `gusztavvargadr_iis`, `gusztavvargadr_ubuntu`, `gusztavvargadr_vagrant`, or `gusztavvargadr_windows` reboots the machine, and the run exits with code `35`. Run Chef Infra Client again once the machine is back, until a run exits with `0`, as `packer` does.

## Update the cookbooks

1. Move the submodule to the tip of `master`, or to the commit to pin:

   ```sh
   git submodule update --remote lib/gusztavvargadr/chef
   git -C lib/gusztavvargadr/chef checkout <commit>
   ```

2. Commit the new pin:

   ```sh
   git add lib/gusztavvargadr/chef
   git commit
   ```

3. Resolve each policy again, so its `Policyfile.lock.json` takes the cookbooks the submodule now has:

   ```sh
   chef update
   ```
