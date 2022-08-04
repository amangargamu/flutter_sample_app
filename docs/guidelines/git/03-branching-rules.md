# Branching Rules

[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

Branching allows you to separate the code context from the stable version of your code, so that you can start developing
on a feature that you want, without having any side-affects.

### Primary Branches

A general thumb of rule for primary branches is to have a branch for each type of environment you have and they should
never be deleted. So if your project has 3 environments, Production, UAT & Development, then we can have branches for
each environment respectively.

| Environment | Branch Name |
| --- | --- |
| Production | master |
| UAT | uat |
| Development | dev |

> `master` is the default main branch when we create a new repository but once setup is done, `dev` should be set as the `main` branch for development and every supporting branch should start, sync & merged into `dev` only.
>

> Nobody should be allowed to push their codes directly to the primary branches, these branches should be updated only through a PR merge.
>

> Build deployment on a specific environment should be done from respective env branch only.
>

### Supporting Branches

Use supporting branches to aid parallel development between team members, ease tracking of features, prepare for
production releases and to assist in quickly fixing live production problems. Unlike the primary branches, these
branches always have a limited life time, they should be deleted once their changes are merged into main branch.

| Type | Branch Name |
| --- | --- |
| Feature | feat |
| Fix | fix |
| Release | release |
| Hotfix | hotfix |

Supporting branches should be accompanied with unique task ids or ticket numbers, it eases the back tracking as well as
maintains the workflow provided by JIRA and other platforms. But if there is no task id or ticket number, you can simply
use a short text which gives the overall idea of the task or story. If available, combination of both can also be used.

> Create a ticket for every task you want to do, even if it is as simple as changing the text color and create supporting branches per task if possible. It is easy to back-track things this way.
>

### Formatting Rules

- Primary branches should never be deleted or recreated
- Supporting branches should originate, synced and merged into `main` branch only
- Supporting branches should be deleted once their changes are merged into main branch
- Use task id or ticket number or short task description while creating the supporting branches
- Use `-` to separate words, not `_`

### Examples

- feat/ID-02
- feat/forget-password
- feat/ID-06-splash-screen
- fix/ID-20
- fix/ID-21-ID-22
- release/user-onboarding
- hotfix/base-url