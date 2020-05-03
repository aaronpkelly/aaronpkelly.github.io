---
title: My personal infrastructure kingdom
description: How I write and publish my thoughts, and the tools I use to do it
tags:
    - infrastructure
    - markdown
    - api
    - meilisearch
    - pages.github.com
---

Below is a link to a diagram showing how all my services are connected.

When I write and publish content to my soure-of-truth (usually a git repo) - various post-commit actions spring into life (via build triggers, webhooks, post-commit hooks, external polling) and trigger a cascade of services. These services could be formatting content in some way (such as republishing blog posts), or rebuilding and redeploying production webapps and various API services.

www.diagram.codes/d/graph/gitpod.io-%3Egit.sr.ht%5B%22commit%22%5D%0Agit.sr.ht-%3Ebuilds.sr.ht%0A%0Abuilds.sr.ht-%3Eapi%5B%22scp%22%5D%0Abuilds.sr.ht-%3Eblog%5B%22push%22%5D%0Abuilds.sr.ht-%3Egitlab%5B%22push%22%5D%0Abuilds.sr.ht-%3Egithub%5B%22push%22%5D%0A%0Aapi-%3Es3%5B%22get%2Fput%22%5D%0Aapi-%3Egit.sr.ht%5B%22get%20raw%20blob%22%5D%0Aapi-%3Elambda%5B%22invokes%22%5D%0A%0Agitlab-%3EAutoDevops%3F%0A%0Agithub-%3EGithubActions%3F%0A%0Alambda-%3Es3%5B%22put%22%5D%0A%0Aapps-%3Es3%5B%22get%22%5D%0A%0A%22play-with-docker.com%22-%3Ehub.docker.com%5B%22runs%22%5D%0A%0Ahub.docker.com-%3Egithub%5B%22polls%22%5D%0A%0AGET%2FPOST-%3Eapi