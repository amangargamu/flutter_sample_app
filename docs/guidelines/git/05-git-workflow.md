# Git Workflow

[How to Use Git and Git Workflows - a Practical Guide](https://www.freecodecamp.org/news/practical-git-and-git-workflows/#how-to-install-git-and-set-up-a-github-account)

[5 Git workflow best practices you've got to use [2021] | Raygun Blog](https://raygun.com/blog/git-workflow/)

### Branches & Syncing

> Go through the[Branching Rules](03-branching-rules.md) if not already done
>

[Git Branch | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/using-branches)

[Git Remote | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/syncing)

```bash
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

### Saving Changes & Commits

[Saving changes | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/saving-changes)

```bash
$ git status                                        //Check the status of current branch

$ git add user/entity/UserDetails.java              //Stage all changes in the file for the next commit
$ git add .                                         //Stage all changes in all the files for the next commit

$ git commit -m "feat(*): Implement the login API"  //Creates a new commit with inline message
$ git commit -am "feat(*): Implement the login API" //Creates a new commit with all staged changes and inline message
```

### Rebase

[git rebase | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)

Rebase should be the default strategy to update the local branches with the main branch. Let’s say currently you are
on `feat/login` branch and you want to update it with main `develop` branch, below will be the steps to follow:

- `git rebase origin/develop` will pull changes from develop and rebase it to your current branch
- If there are no merge conflicts, rebase should be successful and your branch will be updated
- If you encounter any merge conflicts, resolve all of them and do `git add .`. It may keep throwing error till the time
  you don’t resolve all the conflicts and stage the changes
- Once you’ve successfully completed the above step, run `git rebase --continue` to complete the rebase
- To abort the rebase at anytime, you can just run `git --abort`
- If you wish to push your local changes to remote, you may need to do force push `git push -f origin feat/login`

If you are on a branch other than `feat/login` & `develop`, you can follow the below steps in place of 1st step of above
method:

- `git checkout develop` will switch you to `develop` branch
- `git pull` will fetch the latest changes from remote
- `git checkout feat/login` will switch to `feat/login` branch which you want to update
- `git rebase develop` will rebase `feat/login` with `develop` changes
- Alternative to above 2 steps, you can just do `git rebase develop feat/login` and it’ll do the same thing.

### Git Alias

[Git Alias | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/git-alias)

[Get more out of Git with Git aliases | Raygun Blog](https://raygun.com/blog/git-aliases/)