---
title: Digital Ocean
description:
date: 2020-06-01
tags:
  - linux
---

# Digital Ocean

First impressions very good!
+ clean UI
+ very smooth deployment of marketplace app
+ helpful documentation
- no free plan

Because of the no free plan, I tried out the service for a month, and then destroyed my droplet.

# A test deployment

I decided to try and deploy [[MeiliSearch]], to see how easy it was.

## Connecting
The docs made it very easy to SSH into my droplet:

```
➜  ~ ssh root@***.***.***.***
Linux meilisearch-debian-buster-s-1vcpu-1gb-fra1-01 5.6.0-1-cloud-amd64 #1 SMP Debian 5.6.7-1 (2020-04-29) x86_64
                                                        
________________________________________________        
________________________________________________        
             _ _ _ __                     _             
  /\/\   ___(_) (_) _\ ___  __ _ _ __ ___| |__          
 /    \ / _ \ | | \ \ / _ \/ _` | '__/ __| '_ \        
/ /\/\ \  __/ | | |\ \  __/ (_| | | | (__| | | |        
\/    \/\___|_|_|_\__/\___|\__,_|_|  \___|_| |_|        
                                                        
________________________________________________        
________________________________________________        
                                                        
Welcome to your MeilSearch server                       
                                                        
    Documentation: https://docs.meilisearch.com         
    Sources: https://github.com/meilisearch/MeiliSearch 
    Support: support@meilisearch.com                    
                                                        

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.


Thank you for using MeiliSearch.


This is the first login here, and we need to set some basic configuration first.

Do you wish to setup a MEILI_MASTER_KEY for your search engine [y/n]?  n
Do you wish to setup a domain name [y/n]? n
     --- OK, now we will set up MeiliSearch for you! --- 
 Configuration is over. Thanks
 If you want to run this script again, run the following command:
sh /var/opt/meilisearch/scripts/first-login/000-set-meili-env.sh
root@meilisearch-debian-buster-s-1vcpu-1gb-fra1-01:~#
```

## Uploading files

I uploaded a JSON file to my droplet:

```
scp ./Documents/txt/myEmail.json root@***.***.***.***:~
```

Then ran the commands from my [[MeiliSearch]] article to create an index, and import my JSON-ified emails. I refreshed the droplet webpage, and my content was immediately searchable. Very pleasant!