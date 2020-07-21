# ssh

# passwordless ssh
you should always set this up!

you can generate a passwordless SSH key. The only thing that will be used for authentication is the private key

## ssh-copy-id
use this to copy your SSH key to the remote. It will automatically created an `authorized_keys` file:`
```
ssh-copy-id -i ~/.ssh/id_rsa.pub root@95.179.158.61
```