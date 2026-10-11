---
name: git-conventional-commits
description: Guidelines for writing git commit messages
---

## Git Conventional Commits

Good commit messages lead to more readable messages that are easy to follow on Pull Requests and the project history. Here are the guidelines to follow:

- A commit message is divided in 3 parts:
    - **type:** Defines what type of change is contained on the commit. It can be one of the values explained on the [List of commit Types section](#list-of-commit-types).
    - **scope:** Defines on what component of the application the change is done. Use when working on mono-repos. It can be omitted if the change doesn't affect a component but instead some global file.
    - **message:** A short, imperative, on the present tense description of the change. Don't add "." at the end.
- Commits should only be of one "type" at a time. A commit should not both change the CI and add a new feature on the same commit. Those should be separate commits.
- Commits within the same feature branch should impact one component at a time. The scope of all the commit messages on a feature branch should be the same as possible.
- Commits should be relatively short, do something specific, even if the commit is not the whole feature, the commit as is should bring value.
- When revertig a commit, the SHA of the reverted commit should be added to the commit message.

### Example commit messages

Here are some examples as if working on a same branch a new feature
- `feat(ms-rules): add new rule for validating commerce schedule`
- `test(ms-rules): add missing tests for missing commerce schedule rule`
- `docs(ms-rules): update project docs and agents docs with new commerce schedule rule`

And here are some loose examples that may be from different feature branches
- `ci(terraform): create github action to deploy aws infra`
- `chore: move project scripts to root folder`
- `fix(dashboard-front): fix user creation popup`
- `refactor(ms-gateway): change route switch clause for factory pattern`
- `style(ms-shop): format and lint project`

### List of commit Types

- build: Changes that affect the build system or the project dependencies
- ci: Changes to CI configuration files and scripts
- docs: Documentation only changes
- feat: A new feature
- fix: A bug fix
- perf: A code change that improves performance
- refactor: A code change that neither fixes a bug nor adds a feature, does not changes behavior
- style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- test: Adding missing tests or correcting existing tests
- revert: When reverting a previous commit
- chore: Repetitive maintenance and routine tasks like: renaming or moving files, misc tasks that doesn't fit on the other types

