# Gitpod.io
Fantastic tool - I use this as a free workspace in the cloud.

Based on Eclipse Theia.

A short while ago I was on the hunt for a way to edit the code that was checked-in to my github repositories easily. Gitlab offer an online IDE, but Github don't. That's when I found Gitpod. I'm using it right now to create this post.

Really great service to use if you need a quick, disposable IDE to edit your project code.

# Bare repo + multiple projects
Instead of having one workspace per project, I created a bare/blank repo in Github, and after entering the workspace I clone additional repositories.

That way I can use Gitpod to work with multiple projects in the same workspace.

# Setup script
I put this file in the root folder, helps me setup my environment and SSH:

```
#! /bin/bash

set -eu

mkdir ~/.ssh
cp /workspace/gitpod_blank_slate/id_ed25519_passwordless ~/.ssh/
cp /workspace/gitpod_blank_slate/id_ed25519_passwordless.pub ~/.ssh/

ln -sn ~/.ssh/id_ed25519_passwordless ~/.ssh/id_ed25519
ln -sn ~/.ssh/id_ed25519_passwordless.pub ~/.ssh/id_ed25519.pub

curl -L apk-api.strangled.net:5000/dotfiles/install | bash

echo "source ~/.aliases" >> ~/.bashrc
echo "source ~/.dockerfunc" >> ~/.bashrc
echo "source ~/.env" >> ~/.bashrc
echo "source ~/.functions" >> ~/.bashrc
exec bash
```