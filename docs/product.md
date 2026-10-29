# Product

This document describes the why-how-what of the shared Chef cookbook library that [`gusztavvargadr/packer`](https://github.com/gusztavvargadr/packer) provisions its published images with, and of the Chef Docker images.

## Why

Building Windows and Ubuntu machine images, and the development environments on them, repeats the same provisioning: installing Docker, .NET, Git, IIS, Visual Studio, HashiCorp tools, and operating system updates. Written once per image, that provisioning drifts between images and between Windows and Ubuntu.

The repository keeps that provisioning in one place, as Chef cookbooks that `gusztavvargadr/packer` pins as its `lib/gusztavvargadr/chef` submodule, so the images it builds provision with the same code. It also publishes Chef Client and Chef Workstation in Docker images, so Chef runs in a container without being installed on the host.

The repository started in 2016 as a set of Chef samples for provisioning Windows and Ubuntu environments in various development scenarios, with cookbooks moved over from the Vagrant repository. The `samples/cookbooks` path keeps its name from then.

## How

- **One library, many consumers.** A consumer builds on these cookbooks and adds its own next to them, rather than copying them, so a fix lands once for every image.
- **Options as data.** Where a cookbook installs a choice of tools, it defines each as a named option with defaults, and a policy selects and overrides them, so a consumer chooses what to install without changing a recipe.
- **Windows and Ubuntu together.** A cookbook covers both platforms where what it installs exists on both, so an environment reads the same on either.
- **Proved on machines.** Each cookbook has a Test Kitchen configuration that converges it on machines of the platforms it supports, because provisioning that only passes lint has not been shown to install anything.
- **Pinned and layered images.** The `chef-client` and `chef-workstation` images pin the Chef version they install, and both build on `chef-core`, so every image shares one base.

## What

Today the repository has the `gusztavvargadr_*` cookbooks under `samples/cookbooks`, the shared policy helpers and Kitchen configuration under `src`, and the `gusztavvargadr/chef-core`, `chef-client`, and `chef-workstation` Docker images, which its pipeline publishes to Docker Hub for Ubuntu 22.04 and 24.04.

It does not publish the cookbooks to a Chef Supermarket, and a consumer takes them from the repository. The Chef Docker images and the `chef-policy` Chocolatey package under `build/chocolatey` are not maintained and are pending removal.

## Terms

- **Cookbook**: A Chef cookbook under `samples/cookbooks`, named `gusztavvargadr_<name>`, such as `gusztavvargadr_docker`.
- **Policy**: A `Policyfile.rb` or `Policyfile.<variant>.rb`, which names a run list, and the `.yml` file of the same name it reads its options from, where it has one.
- **Options**: The named settings a cookbook defines in `attributes/options.rb`, such as the `engine:latest-community` tool of `gusztavvargadr_docker`, which a policy selects by name.
