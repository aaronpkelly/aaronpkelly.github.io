i was reading https://news.ycombinator.com/item?id=25217291 and he talked about code search tools

I need one of these, so I tried out some of his suggestions

# hound
https://github.com/hound-search/hound

so far i am super impressed with this, it's EASY.

Define your repos in a config file and it will download + index

```
{
    "max-concurrent-indexers" : 2,
    "dbpath" : "data",
    "title" : "Hound",
    "health-check-uri" : "/healthz",
    "vcs-config" : {
        "git": {
            "detect-ref" : true
        }
    },
    "repos" : {
        "aerc" : {
            "url" : "https://git.sr.ht/~sircmpwn/aerc"
        }
        "tinyfm" : {
            "url" : "git@git.sr.ht:~aaronkelly/tinyfm"
        }
    }
}
```

When running the docker container, mount in your config file and ssh key:

```
$ docker run --rm -p 6080:6080 --name hound -v $HOME/src/configfiles/hound:/data -v $HOME/.ssh:/root/.ssh etsy/hound 
2020/12/03 21:00:47 Searcher started for tinyfm
2020/12/03 21:00:47 Searcher started for aerc
2020/12/03 21:00:51 merge 0 files + mem
2020/12/03 21:00:51 547156 data bytes, 539696 index bytes
2020/12/03 21:00:58 merge 0 files + mem
2020/12/03 21:00:58 11687 data bytes, 54353 index bytes
2020/12/03 21:00:58 All indexes built!
2020/12/03 21:00:58 running server at http://localhost:6080...
```


# livegrep
looks snazzy, the documentation is slighly messy and the config files don't look as nice as hound


# opengrok
https://oracle.github.io/opengrok/
it's old-school, haven't tried it but it has a good rep

# sourcegraph
looks cool, but cannot mix sources (e.g. git, svn) on a free plan, must stick to one