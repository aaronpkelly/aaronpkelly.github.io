# sr.ht
A lightweight 'hacker's forge' that I really like.

I'll normally push commits to here first, and have my build jobs propogate them out to other services.

# keeping a log of achievements
I use https://lists.sr.ht/~aaronkelly/announce to record my achievements with this service

# api

generate personal access token: https://meta.sr.ht/oauth/personal-token

authenticate the token:
```
curl \
    -H Authorization:'token 7dbc498508a940f19e695465200877c6' \
    https://meta.sr.ht/api/user/profile	
```

start using api:
```
curl -H Authorization:'token 7dbc498508a940f19e695465200877c6' https://git.sr.ht/api/repos
```