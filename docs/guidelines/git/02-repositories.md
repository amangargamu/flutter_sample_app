# Repositories

[Setting up a repository | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository)

> Hope you’ve already gone through the [Setup](01-setup.md)
>

### Initializing a new repository

[git init | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-init)

```bash
$ cd /path/to/your/existing/code/package
$ git init
```

### Cloning an existing project

[git clone | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-clone)

```bash
$ cd /path/where/you/want/to/clone/the/project
$ git clone <repository-url>
```

### Connecting an existing project

```bash
$ cd /path/to/your/existing/code/package
$ git init
$ git remote add origin <repository-url>
```

### Changing remote URL of an existing project

```bash
$ cd /path/to/your/existing/code/package
$ git remote set-url origin <repository-url>
```

You can check the current repository url by running

```bash
$ git remote -v
```