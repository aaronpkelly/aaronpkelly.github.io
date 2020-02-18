# rebasing
## rebasing on jessfraz
- checkout your repo
- (if you don't want to preserve your history, delete the .git folder)
- rebase on-top of jess's most recent commit: git pull --rebase [JESSREPO]
- force push the git repo

when resolving rebase conflicts, where possible use jess's file, and not mine:
git checkout --ours [file]

REMEMBER:
when rebasing, the concept of OURS and THEIRS switches:
- OURS = the branch you are rebasing onto (jess)
- THEIRS = my branch