# Setup

## Prerequisites

- Administrator privileges
- Access to a command-line
- Your favorite coding text editor
- Username and password for the Github website (optional)

## **Installation**

[Install Git | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/install-git)

Following the above link, you can install Git on mac/Windows/Linux either from terminal or by downloading the installer
file. To verify the successful installation or to check if Git is already installed, run the below command from terminal

```bash
$ git --version
```

You should see the currently installed version of git

```bash
$ git version (latest version here)
```

## **Configuration (Global & Local)**

[git config | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config)

When you are using Git for version control and backing up & sharing the code, you generally have an account on Github,
Bitbucket or Gitlab registered with one of your email addresses. In order to associate your account details (username &
email) with commits you’ll create, you can set the Git configuration like below

```bash
$ git config --global user.name "github_username"
$ git config --global user.email "email_address"
```

`--global` will set this configuration for all the repositories you have on your local system but in some cases, you may
need to have different configuration for one or more repositories. In those cases, you can setup local configuration by
running the below command from inside the repository folder

```bash
$ git config user.name "github_username"
$ git config user.email "email_address"
```

## **SSH Key**

[Git SSH Keys | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/git-ssh)

You can generate new SSH keys from your local machine or can use the existing ones to add authentication to your Git
host accounts like GitHub, Bitbucket or Gitlab. The generated key is pair of a private and public file and the public
key has to be added to your host account.

```bash
.ssh/id_rsa        -> Private Key
.ssh/id_rsa.pub    -> Public Key
```

> These keys are specific to devices and can’t be used across multiple devices. So you have to repeat this same process on each device you plan to run Git on. Generated keys should be stored in `.ssh` folder only, full path looks like `/Users/<username>/.ssh`
>

[Use SSH keys to communicate with GitLab | GitLab](https://docs.gitlab.com/ee/ssh/)
