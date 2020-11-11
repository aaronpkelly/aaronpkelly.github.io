---
title: Scraping websites for their plump JSONs
description: A fun game I want to make
date:   2020-07-18
categories:
  - web development
tags:
  - JSON
  - Javascript
---

# The problem
on this page: https://www.nvidia.com/en-us/geforce-now/games/
the search is bad

discord channel does point to some games lists, but they're images: https://nvidia.custhelp.com/app/answers/detail/a_id/5026



# Getting the JSON
this resource is retrieved: https://static.nvidiagrid.net/supported-public-game-list/gfnpc.json?JSON

copying the curl:

curl 'https://static.nvidiagrid.net/supported-public-game-list/gfnpc.json?JSON' \
  -H 'authority: static.nvidiagrid.net' \
  -H 'accept: */*' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36' \
  -H 'origin: https://www.nvidia.com' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.nvidia.com/en-us/geforce-now/games/' \
  -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'if-none-match: "3dfaabe62903466ddbfda7d1effcda0c"' \
  -H 'if-modified-since: Sat, 20 Jun 2020 15:12:46 GMT' \
  --compressed | jq
  
  # Using resources
 using mdn https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/JSON
 
 # Scraping HTML

 getting the reviewScore
curl https://steamdb.info/app/301640/info -L | grep ratingValue

# See also
[[Static website hosting]]