# repo browsers

## tig

https://en.wikipedia.org/wiki/Tig_(software)

> **Tig** is an [ncurses](https://en.wikipedia.org/wiki/Ncurses "Ncurses")-based [text-mode interface](https://en.wikipedia.org/wiki/Text-based_user_interface "Text-based user interface") for [git](https://en.wikipedia.org/wiki/Git "Git").[[1]](https://en.wikipedia.org/wiki/Tig_(software)#cite_note-Alders2019-1)[[2]](https://en.wikipedia.org/wiki/Tig_(software)#cite_note-Kili2018-2) It functions mainly as a Git repository browser, but can also assist in staging changes for commit at chunk level and act as a [pager](https://en.wikipedia.org/wiki/Terminal_pager "Terminal pager") for output from various Git commands

## lazygit

## magit

it makes every git operation easy: https://news.ycombinator.com/item?id=28954058

## gitk (GUI)

> gitk - The Git repository browser

## see also

https://en.wikipedia.org/wiki/Comparison_of_Git_GUIs


you need emacs for using native magit, but VSCODE has an extension called edamagit

# git hooks

Symlink your git hooks folder so that you commit them as part of your project as
normal:
```
ln -sn .git/hooks .githooks
```

# git init --bare
I don't understand the value of using bare repos yet, especially in a continuous deployment context. Other people seem to think they're useful. Maybe the penny will drop one day!

Anyway, about bare repos...

When you push to a service like Github/Gitlab/git.sr.ht, you are actually already pushing to a _bare repo_.

	Initialize an empty Git repository, but omit the working directory. Shared repositories should always be created with the --bare flag (see discussion below). Conventionally, repositories initialized with the --bare flag end in .git. For example, the bare version of a repository called my-project should be stored in a directory called my-project.git.

	The --bare flag creates a repository that doesn’t have a working directory, making it impossible to edit files and commit changes in that repository. You would create a bare repository to git push and git pull from, but never directly commit to it. Central repositories should always be created as bare repositories because pushing branches to a non-bare repository has the potential to overwrite changes. Think of --bare as a way to mark a repository as a storage facility, as opposed to a development environment. This means that for virtually all Git workflows, the central repository is bare, and developers local repositories are non-bare.
	Git Tutorial: Bare Repositories

	The most common use case for  git init --bare is to create a remote central repository:

	ssh <user>@<host> cd path/above/repo git init --bare my-project.git

	First, you SSH into the server that will contain your central repository. Then, you navigate to wherever you’d like to store the project. Finally, you use the --bare flag to create a central storage repository. Developers would then clone my-project.git to create a local copy on their development machine.
	
	https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-init
	
Github Actions and all that _jazz_ are pretty much just post-receive hooks that are invoked after a commit is made.

## git push [bare-repo]

	A frequently used, modern Git practice is to have a remotely hosted --bare repository act as a central origin repository. This origin repository is often hosted off-site with a trusted 3rd party like Bitbucket. Since pushing messes with the remote branch structure, It is safest and most common to push to repositories that have been created with the --bare flag. Bare repos don’t have a working directory so a push will not alter any in progress working directory content. For more information on bare repository creation, read about git init.
	
	https://www.atlassian.com/git/tutorials/syncing/git-push

# sending patches with git send-email
Drew has put together an amazing tutorial: https://git-send-email.io/#step-3

packages needed on debian
- git send-email
- libmailtools-perl (not marked as a dependency! why not?)
- libauthen-sasl-perl

~/.gitconfig (`git config --global --edit`)
```
user]
        email = aaronkelly@fastmail.com\n
        name = Aaron Kelly
[sendemail]
        smtpserver = smtp.fastmail.com
        smtpuser = aaronkelly@fastmail.com
        smtppass = <APP_SPECIFIC_PASSWORD]
        smtpencryption = tls
        smtpserverport = 587
```


# Helpful git commands when working with submodules (thank you Fred)

fetch changes from submodules

```
git submodule foreach git checkout master
git submodule foreach git pull
```

Make your changes, then submit a merge request.

While working, you can make extensive use of foreach command:

```
git submodule foreach git status
git submodule foreach git checkout -b myBranch
git submodule foreach git commit -am"update doc"
git submodule foreach git push origin myBranch
```

Update submodules references

```
git submodule update --recursive --remote
git submodule foreach git checkout maste

```

# Other good links

https://git-rebase.io/ - Drew DeVault's tutorial

https://news.ycombinator.com/item?id=24586436 -> https://learngitbranching.js.org/ Learn git branching

https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks#using-git-hooks-to-deploy-to-a-separate-production-server

https://news.ycombinator.com/item?id=23465087 (Caprover)

http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/ ( Difference between `git init` and `git init --bare`)

*https://gist.github.com/lemiorhan/8912188*

Oh shit, Git!? (reversing common git commit mistakes) - https://news.ycombinator.com/item?id=24173238

# git articles

https://nvie.com/posts/a-successful-git-branching-model/