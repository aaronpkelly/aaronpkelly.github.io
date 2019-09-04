04/09/2019

I like to play Warcraft. I also like to look up in-game items using an external
website - in this case, wowhead.com.

However, this website only offers results through the browser, there is no api
to retrieve plain-text responses, which means you have to deal with a whole lot
of Javascript and all sorts of mess.

I did notice that there was JSON buried inside the webpage with every query, so
I thought it should be possible to write a small script that would scrape the
webpage, parse the results, and then display them to me in a format that I like.

# The queries
I have a few interesing query URLs that return the results I want - mainly
related to:
- all items used by a profession
- all items crafter by a profession
- all recipes learnable by a profession (BOE's)

# CURLing the page

# converting the page to XML (?)

# grepping just the json

# parsing the json

# outputting the results
