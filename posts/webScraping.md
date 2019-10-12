04/09/2019

I like to play Warcraft, especially now that Warcraft Classic has dropped - I'm
reliving those 15-year old feels.
In addition to playing the game, I also like to consult external websites when
doing things such as looking up up in-game items, and although some of these
sites are great, they mainly target their results to appear in web browsers,
with lots of Javascript, and not via plain-text responses (there is currently no API).

All this is completely fine if you're using a browser - but I want more control
over the data I receive! 

The site I use primarily is https://www.wowhead.com, so I will be focussing on
that. When inspecting their webpages, I did notice that the JSON payload that
contained the results I needed was buried inside the webpage with every query,
so I thought it should be possible to write a small script that would download
the webpage, parse the results, and then display them to me in a format that I
like.

I believe this fits the definition of a "web scraper". Onwards!

# The queries
So I have a few interesing query URLs that return the results I want.
These queries are mainly related to:
- all items used by a profession
- all items crafter by a profession
- all recipes learnable by a profession (BOE's)

Having lists of all these items in plain text is very valuable to me, as there
are a number of in-game addons that accept *lists* of items, which allow you
to do interesting things with them such as track their value at an auction
house, or makes notes of potential upgrades, which would be too time-consuming
and repetitive to do by-hand.

# CURLing the page
The first step just invovles getting the contents of a webpage by using a
popular file transer tool, CURL:
```
```

After inspecting what's downloaded, you can see that the full JSON payload is
present - on the webpage, only a maxiumum of 50 results are shown at a time.
Bonus!

# Getting the JSON with XML
Initially, I attempted to parse the HTML page I downloaded into XML, and then
extract the tag which contained the JSON, but for some reason the webpage that
is downloaded is not well-formatted:
```
```

I don't know what that's about, and to be honest, I didn't want to waste much
time with it when I had another option up my sleeve...

# Getting the JSON with grep
Grep is another fabulous tool which I use daily. Even when I'm away on
campsites and cut off from the world, I'm mentally invoking grep because I
love it so much.

The section of HTML which contains the JSON payload looks like this:
```
```

So a simple grep command will pull it out:
```
```

The JSON is wrapped inside some sort of function, which the website obviously
uses to display the results. We don't need this - it will cause the JSON
parser to fail if I don't remove it. I used some simple bash to trim the string
at both ends:
```
```

# Parsing the JSON

# outputting the results
