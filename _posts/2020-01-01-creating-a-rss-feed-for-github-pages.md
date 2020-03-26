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

The next time you commit a file into this folder, a RSS feed of your posts will be available at <YOUR_SITE>.github.io/feed.xml