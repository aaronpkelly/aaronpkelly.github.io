---
title: Exporting Twitter Data
description: How I exported my Twitter user data into a usable output
date: 2020-03-20
tags:
  - twitter
  - export
---

# Exporting Twitter Data

I recently discovered a really cool app which had twitter integration
(https://fraidyc.at/), which got me thinking about the best way to compile a
list of all the people I'm following.

After a far-too brief session of thought, I came up with two strategies I would
attempt:
- export my twitter data using Twitter's data export function, and hope it gives
me results that are usable and in a sensible format
- use the twitter API, massage the JSON, create a usable list myself

## Exporting my Twitter data

I've never done it before, so I decided to see what the twitter data export tool
gave me if I asked it nicely.

I found the Twitter archive tool at this location:
_https://twitter.com/home -> More -> Settings and Privacy -> Account -> Your Twitter data -> Download an archive of your data -> Twitter -> Download archive_

As I'm not a heavy twitter user, here's a summary of what came out:
```
aaron@DESKTOP-R07OBQT MINGW64 ~/Downloads/twitter_export
$ du -h
116K    ./assets/fonts
11M     ./assets/images/twemoji/v/latest/72x72
13M     ./assets/images/twemoji/v/latest/svg
23M     ./assets/images/twemoji/v/latest
23M     ./assets/images/twemoji/v
23M     ./assets/images/twemoji
24M     ./assets/images
2.8M    ./assets/js
27M     ./assets
0       ./data/direct_messages_group_media
0       ./data/direct_messages_media
0       ./data/moments_media
0       ./data/moments_tweets_media
136K    ./data/profile_media
216K    ./data/tweet_media
703K    ./data
28M     .
```

Not too bad. And the file I'm interested in is here:

```
$ head data/following.js
window.YTD.following.part0 = [ {
  "following" : {
    "accountId" : "757602799",
    "userLink" : "https://twitter.com/intent/user?user_id=757602799"
  }
}, {
  "following" : {
    "accountId" : "151961551",
    "userLink" : "https://twitter.com/intent/user?user_id=151961551"
  }
```

Ok the information on who I'm following is there, but it links to who I'm
following by their `user_id`. Even if I grep those URLs out and make a nice
list, for the app that I'm importing into, `user_id` won't cut it. I need to
somehow convert that a list of `screen_name`'s.

## Using the Twitter API to create a better list

So at this point, with the volume of `user_id` that I needed to convert, I
realised I'd have to start making use of the Twitter API to retrieve information
for each `user_id`, which would contain the piece of information that I'm
seeking - their `screen_name`. I'd also need an API method that could deal with
bulk requests.

And lo and behold, there is an API method that was perfect for this: https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup



I wrote this bash script to pull out all the `user_id` entries, and turn them into a big string:

```
$ cat data/following.js | grep userLink | cut -d '"' -f 4 | cut -d '=' -f 2 | tr '\n' ','
757602799,151961551,1069754908356816897,15784621,16141659,1555045458,2163608041,48274226,759504410,14979481,113963,1225892959,99371628,316341639,23119057,946281596281274373,1611956612,42145629,79008596,16826970,1252453296,1429148504,799166785,21441103,103086746,2295990810,886676941,930871019551776771,20960846,381048540,2462430336,2670064278,17513031,2932738834,17638705,14137772,50124536,15804774,650013,937698624,17099459,1961693772,108149595,58017706,316132288,16489280,118876710,46923427,74795958,31812497,14924965,14862447,14326287,1014467107386511360,191666539,557331120,19245822,215513890,6758842,987342215251869696,721036137066659840,19738805,7753922,15016313,38190583,1587221852,244627772,1002513128,715523756563664896,6603532,3130610603,4782813361,3832562849,18825668,3220693800,800707944866164736,2204497178,1187330941,14640565,9551792,3999382594,2260115140,10809412,260044118,16597587,227456747,817880,347340221,17639049,3252851667,15196120,13520242,2273574830,166583984,1465659204,2916897636,11547582,34488596,480643825,163154809,15948437,197263266,429567341,2301714176,3374231,22551615,370814947,15845390,116166402,5676102,16665197,16891384,9505092,285428413,793469941198520320,50393960,175624200,22906916,52593,14561327,809685,2527833403,94813511,15629200,743757948753633280,2916305152,7396472,22461427,1500013435,368869405,51020838,76606594,22790881,14241468,30304783,625731997,20099268,326840825,10788432,1147149391,1134313830,63485337,807599210,395949360,18831531,17820947,31142751,
```

I could then use `twurl` to convert a list of `user_id` into `screen_name`, by using the correct API endpoint (note: I had to split the `user_id` list up as it was too large initially, the shell I was in refused to make a super long string):

```
$ USER_IDS_0='16826970,1252453296,757602799,151961551,1069754908356816897,15784621,16141659,1555045458,2163608041,48274226,759504410,14979481,113963,1225892959,99371628,316341639,23119057,946281596281274373,1611956612,42145629,79008596,16826970,1252453296,1429148504,799166785,21441103,103086746,2295990810,886676941,930871019551776771,20960846,381048540,2462430336,2670064278,17513031,2932738834,17638705,14137772,50124536,15804774,650013,937698624,17099459,1961693772,108149595,58017706,316132288,16489280,118876710,46923427,74795958,31812497,14924965,14862447,14326287,1014467107386511360,191666539,557331120,19245822,215513890,6758842,987342215251869696,721036137066659840,19738805,7753922,15016313,38190583,1587221852,244627772,1002513128'
$ USER_IDS_1='715523756563664896,6603532,3130610603,4782813361,3832562849,18825668,3220693800,800707944866164736,2204497178,1187330941,14640565,9551792,3999382594,2260115140,10809412,260044118,16597587,227456747,817880,347340221,17639049,3252851667,15196120,13520242,2273574830,166583984,1465659204,2916897636,11547582,34488596,480643825,163154809,15948437,197263266,429567341,2301714176,3374231,22551615,370814947,15845390,116166402,5676102,16665197,16891384,9505092,285428413,793469941198520320,50393960,175624200,22906916,52593,14561327,809685,2527833403,94813511,15629200,743757948753633280,2916305152,7396472,22461427,1500013435,368869405,51020838,76606594,22790881,14241468,30304783,625731997,20099268,326840825,10788432,1147149391,1134313830,63485337,807599210,395949360,18831531,17820947,31142751'
$ twurl /1.1/users/lookup.json?user_id="$USER_IDS_0" | jq .[].screen_name | sed 's/"//g' | xargs printf 'https://twitter.com/%s\n'
https://twitter.com/AbbeyTheatre
https://twitter.com/Dennis_Ritchie
https://twitter.com/DDoSecrets
...
```

Yes, this would do the trick!