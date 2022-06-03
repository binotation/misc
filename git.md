`git remote set-url origin <url>`

`git rebase -r <some commit before all of your bad commits> --exec 'git commit --amend --no-edit --reset-author'`
