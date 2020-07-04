# About

This repo is the source for my github pages blog [https://aaronpkelly.github.io](https://aaronpkelly.github.io)

# How this blog is generated

Edit the following files:

- HEADER.md
- FOOTER.md

Then I run generateIndexAndPostsList.sh to generate:

- POSTS.md
- index.md

Because I have tweaked my Github Pages site a little to take advantage of Jekyll, I also get a few Jekyll plugins, such as:

- RSS feeds
- SEO optimisation (yuck, but I do want people to find my blog)

# hooks

## post-commit

there is no post-commit hook. it goes against git. run ./cleanup.sh yourself or find a better way to generate these files
