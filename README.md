# Chef

<!-- TODOs

chef 14
  move to built-in resources
  check out other chef tooling
  platform and chef version into metadata

  ruby, chef lint, warns
  kitchen machine name from env (suite), allow hostmanager -> multi-machine -> mention at kitchen issue
  license, maintainer

windows
  windows file from cookbook (static and template)
  package from iso (mount / umount)
  generic shell with logs, output, elevated or not
  official windows cookbook usage
  all packages review for idempotence


retest / refactor chef namespaces
dedicated test cookbooks next to actual one
move from packer
cookbook naming -> chef/core, chef/tests (no cookbooks and prefix in folder name)
chef policyfile
kitchen multi machine setup (use platform / suite name (parent folder?)) - custom vagrantfile with helper machines?
chef test to use core resources only - chef spec for core recipe tests
move cookbooks from ws
no abbreviations (e.g. gv_vs to visual studio)
idempotence everywhere

migrate common cookbooks
clean up local cookbooks
move stable cookbooks to own repos

samples for client, dk, ws, etc

windows firewall enable / disable
windows update configure idempotence
windows autologin

docker split per platform?
docker swarm operations?

msu.msu
chef 14
berkshelf before packer
chef policyfile / chef-run
split windows / linux chef
autologin for docker and download images
-->

This repository contains [Chef] cookbooks, mostly used by the [Packer] and [Vagrant] setups.

[Chef]: https://www.chef.io/chef/
[Packer]: https://github.com/gusztavvargadr/packer
[Vagrant]: https://github.com/gusztavvargadr/vagrant
