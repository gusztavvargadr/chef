# Reference

This document lists the cookbooks under `samples/cookbooks`, their recipes, the collections they read, and the options they define.

A change to a cookbook's name, recipes, or options updates this guide in the same change.

## Cookbooks

The table lists each cookbook by the name its `metadata.rb` gives it, with its directory under `samples/cookbooks`, the recipes under its `recipes`, and the file in its directory that defines its options.

| Cookbook | Directory | Recipes | Options defined in |
| --- | --- | --- | --- |
| `gusztavvargadr_chef` | `chef` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_development` | `development` | `default`, `initialize`, `apply`, `cleanup` | None |
| `gusztavvargadr_docker` | `docker` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_dotnet` | `dotnet` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_git` | `git` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_hashicorp` | `hashicorp` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_hello_world` | `hello-world` | `default` | None |
| `gusztavvargadr_iis` | `iis` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_ubuntu` | `ubuntu` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_vagrant` | `vagrant` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_virtualbox` | `virtualbox` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_visualstudio` | `visualstudio` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_vsts` | `vsts` | `default`, `initialize`, `apply`, `cleanup` | `attributes/options.rb` |
| `gusztavvargadr_windows` | `windows` | `default`, `initialize`, `apply`, `cleanup` | None |

## Collections

The table lists each collection a cookbook reads from the node attribute of its own name, which its `attributes/default.rb` declares empty, and what a key under it names.

| Cookbook | Collection | A key names |
| --- | --- | --- |
| `gusztavvargadr_chef` | `tools` | An option of the cookbook |
| `gusztavvargadr_docker` | `tools` | An option of the cookbook |
| `gusztavvargadr_docker` | `images` | An image that `apply` pulls with `docker pull` |
| `gusztavvargadr_dotnet` | `tools` | An option of the cookbook |
| `gusztavvargadr_git` | `tools` | An option of the cookbook |
| `gusztavvargadr_hashicorp` | `tools` | An option of the cookbook |
| `gusztavvargadr_iis` | `tools` | An option of the cookbook |
| `gusztavvargadr_ubuntu` | `updates` | `dist-upgrade`, which `apply` runs as `apt-get dist-upgrade` |
| `gusztavvargadr_ubuntu` | `tools` | An option of the cookbook |
| `gusztavvargadr_vagrant` | `tools` | An option of the cookbook |
| `gusztavvargadr_vagrant` | `plugins` | A Vagrant plugin that `apply` installs where it is not installed |
| `gusztavvargadr_vagrant` | `boxes` | A Vagrant box that `apply` adds for the `provider` its value sets, where it is not added |
| `gusztavvargadr_virtualbox` | `tools` | An option of the cookbook |
| `gusztavvargadr_visualstudio` | `tools` | An option of the cookbook |
| `gusztavvargadr_vsts` | `tools` | An option of the cookbook |
| `gusztavvargadr_windows` | `updates` | `install`, which `apply` runs to install the updates Microsoft Update offers |
| `gusztavvargadr_windows` | `native_packages` | A native installer package that `apply` downloads from its `source` and runs with its `install` arguments, where its `executable` does not exist |

## Options

The table lists each option a cookbook defines in its `attributes/options.rb`, the other names it defines with the same value, and the platforms it installs on.

| Cookbook | Option | Other names | Platforms |
| --- | --- | --- | --- |
| `gusztavvargadr_chef` | `workstation:latest` | `workstation` | Windows, Ubuntu |
| `gusztavvargadr_docker` | `engine:latest-community` | `engine:latest`, `engine` | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `runtime:10.0` | `runtime:latest`, `runtime` | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `runtime:9.0` | | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `runtime:8.0` | | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `sdk:10.0` | `sdk:latest`, `sdk` | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `sdk:9.0` | | Windows, Ubuntu |
| `gusztavvargadr_dotnet` | `sdk:8.0` | | Windows, Ubuntu |
| `gusztavvargadr_git` | `app:latest` | `app` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `vagrant:latest` | `vagrant` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `packer:latest` | `packer` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `terraform:latest` | `terraform` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `consul-template:latest` | `consul-template` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `consul:latest` | `consul` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `vault:latest` | `vault` | Windows, Ubuntu |
| `gusztavvargadr_hashicorp` | `nomad:latest` | `nomad` | Windows, Ubuntu |
| `gusztavvargadr_iis` | `server:latest` | `server` | Windows |
| `gusztavvargadr_ubuntu` | `desktop:ubuntu` | `desktop` | Ubuntu |
| `gusztavvargadr_ubuntu` | `desktop:xubuntu` | | Ubuntu |
| `gusztavvargadr_vagrant` | `app:latest` | | Windows, Ubuntu |
| `gusztavvargadr_vagrant` | `app` | | Windows, Ubuntu |
| `gusztavvargadr_virtualbox` | `app:7.2` | `app:latest`, `app` | Windows, Ubuntu |
| `gusztavvargadr_virtualbox` | `app:7.1` | | Windows, Ubuntu |
| `gusztavvargadr_visualstudio` | `ide:2022-community` | `ide:2022`, `ide:latest`, `ide` | Windows |
| `gusztavvargadr_vsts` | `agent:latest` | `agent` | Windows, Ubuntu |
