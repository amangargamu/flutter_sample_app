# Useful git actions

```
$ git branch                    //List all of the branches in your repository
$ git branch -a                 //List all the remote branches

$ git branch feat/onboarding    //Create a new branch
$ git branch -m feat/login.     //Rename the current branch
$ git checkout -b feat/logout.  //Create and switch to a new branch

$ git checkout feat/login       //Switch to another branch
$ git fetch origin develop //Fetch a remote branch
$ git fetch origin              //Fetch all the remote branches
$ git fetch --all               //Fetch all the remotes with their branches

$ git branch -d feat/login      //Delete branch from your repository
$ git branch -D feat/login      //Force delete branch from your repository
$ git push origin :feat/login   //Delete the remote branch post deletion from local

$ git push origin feat/login    //Push the current branch to remote
$ git push -f origin feat/login //Force push the current branch to remote
$ git push origin --all         //Push all the local branches to remote

$ git pull                      //Fetch & merge remote’s copy of the current branch
$ git pull origin               //Same as above
$ git pull origin develop       //Same as above
$ git pull --rebase origin      //Fetch & rebase remote’s copy of the current branch
```

## Checkout a repository
create a working copy of a local repository by running the command
```sh
git clone /path/to/repository
```
when using a remote server, your command will be
```sh
git clone username@host:/path/to/repository
```
## Add & commit
You can add changes (add it to the Index) using
```sh
git add <filename>
```
To add all the files
```sh
git add .
```

## Merge commits
To merge multiple commits in single one use following commands:
```sh
git reset HEAD~numberOfCommits
git add .
git commit -m "Commit message"
```
To push above changes we need to use force push
```sh
git push origin <Branch name> -f
```
## Resolve conflicts using rebase

First make sure __base branch__ is up to date, then use following commands :
```sh
git pull --rebase origin <base branch>
```
Now, resolve all the conflicts manually, after resolving use following commands :
```sh
git add .
git rebase --continue
```
## Branching
create a new branch named "my_branch" and switch to it using
```sh
git checkout -b my_branch
```
switch back to different existing branch
```sh
git checkout <branch name>
```
and delete the branch again
```sh
git checkout -d my_branch
```

### Access git cheat sheet
[Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)
