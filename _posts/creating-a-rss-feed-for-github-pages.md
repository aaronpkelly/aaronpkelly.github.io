---
title: Creating a RSS feed for Github Pages
description: How I added an RSS feed to my blog on Github Pages using jekyll-feed
date: 2020-01-02
tags:
  - jekyll
  - rss
  - github
  - jekyll-feed
---

# Creating a RSS feed for Github Pages

In the beginning, it was good. A large folder of posts, some simple bash scripts to generate an index with links to all of them... all was well. Soon however, I realised I was missing something I really wanted - the ability to offer a good RSS feed to my readers.

I knew Github Pages offered Jekyll support, and initially I did try using it pretty heavily, but in true style I completely overdid it, burned out trying to include too many features, and in my frustration I ended up eviscerating all remenants of Jekyll markdown in my blog in order to return to a simple design.

But it always troubled me... I didn't have a native RSS link I could offer to readers. So, I decided to think about it some more. I knew that if I could strike a balance between a simple, maintainable site, and including only a little extra Jekyll markdown... well, I just might be able to get my RSS feed.

# Tell me how

Create a _Gemfile_ in the root of your project, and make sure the following is inside:

```
gem 'jekyll-feed'
```

Create _config.yml file in your root fodler:

```
plugins:
  - jekyll-feed
title: Aaron Kelly's Blog
description: Aaron Kelly's Blog
author: Aaron Kelly
```

- put your posts in a _posts folder in the root of your github pages site
- name your posts in this format: YYYY-MM-DD-your-post-name.md

And that's it. I finally got [my RSS feed](https://aaronpkelly.github.io/feed.xml), and you should be close to getting yours too. When you next commit your changes, and if all goes to play, a RSS feed will be available at <YOUR_SITE>.github.io/feed.xml. From here on, any time you create a new post in your _posts folder, your feed.xml will be updated automatically. Magic.