# Setup

## **Installation**

[Install Git | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/install-git)

Following the above link, you can install Git on mac/Windows/Linux either from terminal or by downloading the installer
file. To verify the successful installation or to check if Git is already installed, run the below command from terminal

```bash
$ git --version
```

You should see the currently installed version of git

```bash
$ git version 2.9.2
```

## **Configuration (Global & Local)**

[git config | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config)

When you are using Git for version control and backing up & sharing the code, you generally have an account on Github,
Bitbucket or Gitlab registered with one of your email addresses. In order to associate your account details (username &
email) with commits you’ll create, you can set the Git configuration like below

```bash
$ git config --global user.name "Chandra Pratap Singh"
$ git config --global user.email "cp@grappus.com"
```

`--global` will set this configuration for all the repositories you have on your local system but in some cases, you may
need to have different configuration for one or more repositories. In those cases, you can setup local configuration by
running the below command from inside the repository folder

```bash
$ git config user.name "Chandra Pratap Singh"
$ git config user.email "cpsingh202@gmail.com"
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

## **Multiple Accounts**

It is very usual that you have multiple Git accounts, either from different email addresses or of different hosts. In
that case, you’ll need to add multiple auth configurations on your machine per account/host. You can just repeat the
above steps to generate SSH key for each account.

```bash
.ssh/id_rsa_official
.ssh/id_rsa_official.pub
.ssh/id_rsa_personal
.ssh/id_rsa_personal.pub
```

> You can use any convenient naming convention to differentiate the generated keys but keep the prefix `id_rsa` as above only.
>

Now, how does the system will know that which account is to be used for which repository? This is done by maintaining a
raw `config` file inside the same `.ssh` folder(`/.ssh/config`), content of the file looks like below

```bash
Host official
  Hostname gitlab.com
  IdentityFile ~/.ssh/id_rsa_official

Host personal
  Hostname bitbucket.org
  IdentityFile ~/.ssh/id_rsa_personal
```

Now whenever you you use a repository url, just replace the `gitlab.com` with `official` and `bitbucket.org`
by `personal` from it.

> You can choose the host name of your choice but ensure that the key’s suffix and host name are same, e.g., `key: id_rsa_official` & `Host official`
>