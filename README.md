# About

This repo is the source for my website [https://aaronpkelly.github.io](https://aaronpkelly.github.io)

# How this blog is generated

I edit the following files:
- HEADER.md
- FOOTER.md

Then I run generateIndexAndPostsList.sh to generate:
- POSTS.md
- index.md

Because I have tweaked my Github Pages site a little to take advantage of Jekyll, I also get a RSS feed generated for me at 

# History - the Strange Tale of the RSS Feed

If you want a little history of how I started this blog, read on!

In the beginning, it was good. A large folder of posts, some simple bash scripts to generate an index with links to all of them... all was well. Soon however, I realised I was missing something I really wanted - the ability to offer a good RSS feed to my readers.

I knew Github Pages offered Jekyll support, and initially I did try using it pretty heavily, but in true style I completely overdid, burned out with too mnay features, and in my frustration I ended up eviscerating all remenants of Jekyll markdown in my blog, in order to return to a simple design.

But it always troubled me... I didn't have a native RSS link I could offer to readers. I decided to think about it some more. I knew that if I could strike a balance between a simple, maintainable blog, and maybe including a little extra Jekyll markdown... well I just might be able to get my RSS feed.

And I did it, without changing too much. [I got my RSS feed](https://aaronpkelly.github.io/feed.xml). You can even read my post on it [here](_posts/2020-01-01-creating-a-rss-feed-for-github-pages.md).