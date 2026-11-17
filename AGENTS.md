# Agents

Read [README.md](README.md) and [CONTRIBUTING.md](CONTRIBUTING.md) before changing anything.

## Ask before

- Running any `acceptance-*` target, `acceptance`, or `all` with the `ec2` driver, because it launches AWS instances that cost money until they are destroyed. The `ec2` driver is experimental: its AMIs are gone, so such a run fails at create.

Everything else, including acceptance with the `vagrant` driver, needs no approval.

## Conventions

- Specs and plans go on the issue or the pull request, not in `docs/superpowers`.
- Review findings go on the pull request, as review comments on the lines they concern. Each thread gets a reply saying what was done: fixed (with the commit), moved to an issue (with the link), or left as is (with why). Then the thread is resolved.
- Findings outside the pull request's scope become issues.
- CI passes, and is the evidence. Where no pipeline covers a change, run the checks [CONTRIBUTING.md](CONTRIBUTING.md) lists locally, and say in the pull request which ones ran.
