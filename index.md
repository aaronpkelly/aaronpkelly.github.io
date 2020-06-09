Howdy, I'm Aaron, and I'm really good at breaking things. Occasionally, I'll learn something in the process.

![avatar](https://avatars1.githubusercontent.com/u/29888436?s=460&u=03df457371669048031a735802c33b93d07a1f10&v=4)

# What's here? Posts. Lots of them

I like to write about my tech experiences *a lot*, so posts are the the main focus of my website. If you want the RSS feed, it's [here](https://aaronpkelly.github.io/feed.xml).

Why choose a blog? I just think it suits how my brain works. Writing about my interests in blog post style is a good way for me to:

- force me to make my content presentable, simple and to the point
- put it in a format that's easily shareable in the public domain
- have a valuable resource to return to when I inevitably forget how to do something for the 100th time
- create value from all my stupid side projects and silly ideas
- talk to and connect with like minded people around the world!

Hopefully, it will be useful to someone somewhere (I like helping people!), and it will encourage me to keep my standards up. The tech community has given me so much for free, and it's only right that I give something back.

My aim for them is to contain insightful, well-curated and to-the-point information about a particular topic, revised and updated over time. Some will exist simply to share my narrow experiences on a particular topic, however some may take the form of larger walkthrough guides that I have compiled over a long period of time.

So that's the goal... but in reality, this blog is mostly still a brain-dump of every topic I'm interested in, while I frantically try to keep up and organise my thoughts in a presentable way. I do hope you find something useful though.

## Blog-driven development?

I know... the world doesn't need more buzzwords! But I don't know what else to call it and the name stuck with me. How do I define it? A record of all my thoughts, efforts and experiments, meticilously documented and then channelled into public-facing blog post... viola - [[Blog-driven development]]. I don't expect it to catch on :)

## Runnable code examples and embedded terminals OMG

I use embedded code examples in some posts, courtesy of https://repl.it!

I'll also occasionlly throw in some asciinema examples, that mimic a running a process in a terminal.

I think both of the above help with explaining a point, and they're also super fun.

If for some reason you experience funny issues with the embedded elements, e.g. code output seems to be invisible/styled incorrectly, the style elements needed to display them may be blocked by your browser, an addon, or DNS blocking.

# Posts

<div id="archives">
{% for category in site.categories %}
  <div class="archive-group">
    {% capture category_name %}{{ category | first }}{% endcapture %}
    <div id="#{{ category_name | slugize }}"></div>
    <p></p>

    <h3 class="category-head">{{ category_name }}</h3>
    <a name="{{ category_name | slugize }}"></a>
    {% for post in site.categories[category_name] %}
    <article class="archive-item">
      <h4><a href="{{ site.baseurl }}{{ post.url }}">{{post.title}}</a></h4>
    </article>
    {% endfor %}
  </div>
{% endfor %}
</div>

[Deploying a small ecommerce website](_posts/2020-06-07-Deploying-a-small-ecommerce-website.md)

[Docker](_posts/2020-06-01-Docker.md)

[Digital Ocean](_posts/2020-06-01-Digital-Ocean.md)

[ SSHing into an AWS Fargate container](_posts/2020-05-31-SSHing-into-an-AWS-Fargate-container.md)

[Sending notifications to Telegram using AWS Cloudwatch](_posts/2020-05-31-Sending-notifications-to-Telegram-using-AWS-Cloudwatch.md)

[Hosting a serverless static website on AWS S3](_posts/2020-05-31-Hosting-a-serverless-static-website-on-AWS-S3.md)

[Deploying a docker image to AWS ECS ](_posts/2020-05-31-Deploying-a-docker-image-to-AWS-ECS.md)

[Contacting an external API using AWS Lambda](_posts/2020-05-31-Contacting-an-external-API-using-AWS-Lambda.md)

[AWS](_posts/2020-05-31-AWS.md)

[AWS Fargate notes](_posts/2020-05-31-AWS-Fargate-notes.md)

[AWS Codebuild notes](_posts/2020-05-31-AWS-Codebuild-notes.md)

[AWS Cloudformation notes](_posts/2020-05-31-AWS-Cloudformation-notes.md)

[AppImage, Flatpak and Snap](_posts/2020-05-28-appimage-flatpak-and-snap.md)

[System monitoring using sound](_posts/2020-05-25-system-monitoring-with-sound.md)

[Testing a NodeJS app with Mocha](_posts/2020-05-24-testing-a-nodejs-app-with-mocha.md)

[Test-driven-development (TDD)](_posts/2020-05-24-tdd.md)

[Linux](_posts/2020-05-24-Linux.md)

[Generating quiz questions](_posts/2020-05-17-quiz-question-generation.md)

[Creating a webapp with database on Heroku](_posts/2020-05-16-creating-a-webapp-with-database-on-heroku.md)

[MX Linux](_posts/2020-05-12-MX-Linux.md)

[The prison workout](_posts/2020-05-11-the-prison-workout.md)

[Running GUI apps in a container](_posts/2020-03-22-Running-GUI-apps-in-a-container.md)

[Containers](_posts/2020-03-21-containers.md)

[Exporting Twitter Data](_posts/2020-03-20-Exporting-twitter-data.md)

[Searching for an email indexing tool](_posts/2020-03-06-Searching-for-an-email-indexing-tool.md)

[Meilisearch](_posts/2020-03-06-MeiliSearch.md)

[Preparing text files for indexing](_posts/2020-03-05-Preparing-text-files-for-indexing.md)

[Sorting and formatting an MBOX export](_posts/2020-03-04-Sorting-and-formatting-MBOX-output.md)

[Journey to the center of the MBOX](_posts/2020-03-03-Journey-to-the-center-of-the-MBOX.md)

[Exfiltrating data from cloud services](_posts/2020-03-02-Exfiltrating-data-from-cloud-services.md)

[Indexing an 8GB MBOX file](_posts/2020-03-01-Indexing-an-8GB-MBOX-file.md)

[Dungeons and Dragons resources](_posts/2020-02-12-dungeons-and-dragons-resources.md)

[Web development](_posts/2020-02-11-Web-development.md)

[Building a budget gaming pc](_posts/2020-02-11-Building-a-budget-gaming-pc.md)

[Cheat sheets for printing](_posts/2020-02-10-cheat-sheets-for-printing.md)

[Running GeForce Now on Linux](_posts/2020-02-09-Running-GeForce-Now-on-Linux.md)

[Cloud gaming](_posts/2020-02-08-cloud-gaming.md)

[Itch.io](_posts/2020-02-07-itch.io.md)

[Linux Gaming](_posts/2020-02-06-linux-gaming.md)

[Live Coding](_posts/2020-02-05-live-coding.md)

[Computer Music](_posts/2020-02-04-computer-music.md)

[Game engines](_posts/2020-02-02-game-engines.md)

[Searching for a good Container OS](_posts/2020-02-01-searching-for-my-container-os.md)

[Game ideas](_posts/2020-02-01-game-ideas.md)

[Glossary](_posts/2020-01-31-glossary.md)

[Replacing Linux Firmware](_posts/2020-01-12-replacing-linux-firmware.md)

[Using AWS API Gateway](_posts/2020-01-11-Using-AWS-API-Gateway.md)

[APIs](_posts/2020-01-10-apis.md)

[Creating a bookmarklet for hacker news](_posts/2020-01-09-creating-a-bookmarklet-for-hacker-news.md)

[The hunt for my digital life pre-2004](_posts/2020-01-08-the-hunt-for-my-digital-life-pre-2004.md)

[My personal infrastructure kingdom](_posts/2020-01-07-my-personal-infrastructure-kingdom.md)

[Blocking ads and unwanted internet traffic](_posts/2020-01-06-Blocking-ads-and-unwanted-internet-traffic.md)

[Tools I use daily](_posts/2020-01-05-Tools-I-use-daily.md)

[Making my posts discoverable](_posts/2020-01-03-making-my-posts-discoverable.md)

[Creating a RSS feed for Github Pages](_posts/2020-01-02-creating-a-rss-feed-for-github-pages.md)

[Bookmarks](_posts/2020-01-01-bookmarks.md)

[Blog-driven development (BDD)](_posts/2020-01-01-Blog-driven-development.md)

[Backgrounding jobs in Linux](_posts/2019-08-10-Backgrounding-jobs-in-Linux.md)

[Robert C. Martin ("Uncle Bob")](_posts/2019-08-07-uncleBob.md)

[Steam](_posts/2019-07-27-steam.md)

[Named pipes in Linux](_posts/2019-07-27-Named-pipes-in-Linux.md)

[My favourite albums](_posts/2019-07-27-My-favourite-albums.md)

[ Learning music with Ableton](_posts/2019-07-27-Learning-music-with-Ableton.md)

[On purchasing](_posts/2018-02-25-purchasing.md)

[I write blog posts](_posts/2018-02-25-How-I-write-blog-posts.md)

[TinyQuest](_posts/2017-09-24-TinyQuest.md)

[A REPL in your shell with FZF](_posts/2017-09-24-A-REPL-for-shell-commands.md)

[](_posts/1mb.co.md)


# The future

The above list is pretty unstructured. It might be great in future to:

- organise them by tag/category

- organise them by association (graph links)

# Like a post? Grab a hardcopy

If I've done a good enough job with one of my posts, you may feel like it's worthy to have the breath of life breathed into it, and have it printed out somewhere. I've considered putting PDFs of popular articles on https://gumroad.com (using "pay what you want" pricing). Let me know if this interests you!

# Contact

email: aaronkelly@fastmail.com

twitter: https://twitter.com/aaronpaulkelly

bandcamp: aaronkelly.bandcamp.com

steam: https://steamcommunity.com/id/Vorophobe/

# Donate

If you've found anything here useful, please consider my caffeine levels:

[Buy Me a Coffee](https://www.buymeacoffee.com/aaronkelly)

[Paypal](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=DTJST2MAMPYQ8&currency_code=EUR&source=url)

other ways: patreon / subscribestar / github sponsors / donorbox.orgstripe / dwolla / flattr / wepay / bitcoin (coming soon)

# Other blogs and peeps I follow

[https://github.com/WatkinGoWrong](https://github.com/WatkinGoWrong)

[https://blog.fredericrous.com/](https://blog.fredericrous.com/)

# Quotes I like enough to put on the front page

"Programs must be written for people to read and only incidentally for machines
to execute" - (SICP)

"The computer industry is the only industry that is more fashion-driven than women's fashion." - Larry Ellison
