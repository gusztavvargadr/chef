# chef

[Chef](https://www.chef.io) cookbooks for provisioning Windows and Ubuntu environments.

The cookbooks live under `samples/cookbooks`, a path kept for historical reasons.

## Requirements

- [Chef Workstation](https://docs.chef.io/workstation/), only to resolve and export policies yourself. A bootstrapped machine doesn't need it.
- Chef Infra Client or [Cinc Client](https://cinc.sh) 18 or later on each machine a policy provisions. The bootstrap scripts install Cinc Client where neither is installed.

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

## Bootstrapping

To provision a machine with one of the policies this repository publishes, without Chef Workstation, run the bootstrap script as root, or in an elevated session on Windows. The script installs Cinc Client where no client is installed, downloads the policy's archive, and runs it in local mode.

On Ubuntu:

```sh
curl -fsSL https://github.com/gusztavvargadr/chef/releases/latest/download/provision.sh | sudo CHEF_POLICY=gusztavvargadr_docker bash
```

On Windows:

```powershell
$env:CHEF_POLICY = 'gusztavvargadr_docker'
powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://github.com/gusztavvargadr/chef/releases/latest/download/provision.ps1 | iex"
```

The script exits with the client's exit code, so the PowerShell one-liner runs it in a child process to keep your session open.

| Variable | Default | Meaning |
|---|---|---|
| `CHEF_VERSION` | `18` | The Cinc Client version to install. A major version installs its latest release. |
| `CHEF_POLICY` | empty | The policy to run, such as `gusztavvargadr_docker`. Empty, with no `CHEF_POLICY_PATH`, installs the client only. |
| `CHEF_POLICY_URL` | `https://github.com/gusztavvargadr/chef/releases/latest/download/${CHEF_POLICY}.tgz` | Where to download the policy's archive. |
| `CHEF_POLICY_PATH` | empty | A local policy to run in place of the download: an archive, or an exported directory, which is run in place and kept. |
| `CHEF_ATTRIBUTES` | `default` | Passes `attributes.<value>.json` from the policy to the client, where the file exists. |
| `CHEF_RUN_LIST` | empty | A named run list of the policy to run. |

- The policies are the `.tgz` assets of the [`latest` release](https://github.com/gusztavvargadr/chef/releases/tag/latest), named after the policy.
- A machine that has Chef Infra Client keeps it, and the script runs the policy with it. On Windows, where Chef Infra Client is installed somewhere other than `C:\opscode\chef`, the script stops instead of installing Cinc Client, whose installer would replace it.
- On Windows, the script also installs [Chocolatey](https://chocolatey.org) where it's missing, because some cookbooks install packages with it. `CHOCOLATEY_VERSION` sets its version, `2.7.3` by default. The script needs Windows Server 2019, Windows 10 1803, or later, for `tar`.
- Exit code 35 means a reboot is pending. Run the script again after the reboot.
- The release always holds the latest scripts and archives, from `master`. Earlier versions aren't kept.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
