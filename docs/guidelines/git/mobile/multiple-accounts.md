# **How to handle multiple account ?**

Most VCS support authentication with SSH or HTTPS: to make things easier, always prefer using SSH where possible.
Git does not cache the user's credentials by default, so with HTTPS, you need to re-enter them each time you perform a clone, push, or pull. On the other hand, SSH is safer.

_Follow the following steps to generate a new key pair for your  account :_
**1) Generate an SSH key :**

```
ssh-keygen -t ed25519 -C "your_personal_email@example.com" -f ~/.ssh/<personal_key>
```

**OR**

```
ssh-keygen -t rsa -b 4096 -C "your_personal_email@example.com" -f ~/.ssh/<personal_key>
```

**-C** is for adding a comment, it can be anything but it will be helpful to know the email associated with your account.
**-f** is to define a filename, and creating a key with a descriptive name will help you remember which key is used for which user/remote.

**2) Add a passphrase**

Next, you will be prompted to add an (optional) passphrase, recommended to do so because it adds an extra layer of security.
*To update the passphrase for your SSH keys:*
```
ssh-keygen -p -f ~/.ssh/<personal_key>
```
**3) ssh-agent**

Use ssh-agent to securely save your passphrase.
```
eval "$(ssh-agent -s)" && \
ssh-add -K ~/.ssh/<personal_key>
```
**4) Edit your SSH config**

If you don’t have one, create an SSH config file
`touch ~/.ssh/config` and add the following contents to it:
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/<created_key>
```
Setting Host to * for every key because we will use Git configs to select the appropriate SSH key based on profiles
**5) Copy the SSH public key**

macOS
```
tr -d '\n' < ~/.ssh/<created_key>.pub | pbcopy
```
Linux
```
xclip -sel clip < ~/.ssh/<created_key>.pub
```
Windows
```
cat ~/.ssh/<created_key>.pub | clip
```

**6) Structure your workspace for different profiles**

Create two overriding .gitconfigs for each dir like this:
```
/myhome/
|__.gitconfig
|__work/
     |_.gitconfig.work
|__personal/
    |_.gitconfig.pers
```
**7) Set up your Git configs**

```
# ~/personal/.gitconfig.pers

[user]
email = your_pers_email@example.com
name = Your Name

[github]
user = “mynickname”

[core]
sshCommand = “ssh -i ~/.ssh/<personal_key>”
```

```
# ~/work/.gitconfig.work

[user]
email = your_pro_email@google.com
name = Your Name

[github]
user = “pro_name”

[core]
sshCommand = “ssh -i ~/.ssh/<professional_key>”
```
To check your activated config options
```
git config --list
```
**8) Repeat for every account/profile .**

you can now choose to, clone your repo, add or change your remote with:
```
git clone git@<repository.domain.com>:<username>/<repo_name>.git
```
```
git remote add origin git@<repository.domain.com>:<username>/<repo_name>.git
```
```
git remote set-url origin git@<repository.domain.com>:<username>/<repo_name>.git
```

[Git accounts cheat sheet](https://res.cloudinary.com/da8kiytlc/image/upload/v1647871440/Cheatsheets/GitGuardian_GitHub_Accounts_Cheatsheet.pdf)
