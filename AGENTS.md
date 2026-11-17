# Agents

Read [README.md](README.md) and [CONTRIBUTING.md](CONTRIBUTING.md) before changing anything.

## Ask before

- Running an `acceptance` target with the `ec2` driver, because it launches AWS instances that cost money until they are destroyed.
- Running `docker compose push`, or the image pipeline with its `Force Publish` parameter, because it replaces the published images.

Everything else, including acceptance with the `vagrant` driver, needs no approval.

## Conventions

- Specs and plans go on the issue or the pull request, not in `docs/superpowers`.
- Review findings become issues.
- CI passes, and is the evidence. Where no pipeline covers a change, run the checks [CONTRIBUTING.md](CONTRIBUTING.md) lists locally, and say in the pull request which ones ran.
