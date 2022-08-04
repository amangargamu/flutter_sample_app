## How to raise a pull request on git ?

1. Commit all the changes using following commands:

    - First check current status using
    `git status`
    - To track all the untracked files use
    `git add .`
    - Now to commit all the changes you have made
    `git commit -m "Commit message here"`

2. Before creating a pull request you need to verify certain things:

    - You have to check that your variables and class names match the [team's guideline](https://grappus.github.io/#writing-meaningful-names).
    - You have to run `prcheck.sh` locally.
    - You have confirmed that no warnings are showing in my `Dart Analysis` tab in Studio.

3. Create pull request by following these steps :

    - To push your code use
    `git push origin <your branch name>`
    - Now go to github repository and click on Pull requests
    - Click on __Compare & pull__ request button will appear under Pull request or click on __New pull request__ button
    - you can also change your base branch and compare branch in this screen
    - Finally click on __Create pull request__ button to raise your PR.
