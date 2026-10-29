# chef

This repository is the shared [Chef](https://chef.io) cookbook library that [`gusztavvargadr/packer`](https://github.com/gusztavvargadr/packer) builds its published images with, and the Chef Docker images, which are pending removal.

## Guides

- [Product](docs/product.md): Why the cookbook library and the Chef Docker images exist, what they are today, and the terms they use.
- [Architecture](docs/architecture.md): How the cookbooks, the shared policy and Kitchen configuration, and the Docker images depend on each other, and what stays true of them as they change.
- [Engineering](docs/engineering.md): How the cookbooks and the Docker images are built, linted, tested, and checked, locally and in the pipelines, and how a change to them is proven.
- [Usage](docs/usage.md): How to use the cookbooks in a Chef policy of another repository, as a submodule the way `packer` does.
- [Reference](docs/reference.md): Each cookbook's name, directory, recipes, collections, and options.
