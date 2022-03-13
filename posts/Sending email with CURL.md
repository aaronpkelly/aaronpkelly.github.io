---
title: Sending email with CURL
description: How to send email easily with CURL
date: 2020-01-06
tags:
  - cron
  - curl
  - email
  - github
  - smtp
  - workflows
---

I have a [[gitscraper]] project, which is a project that uses github workflows to regularly scrape a website, and commit any changes to the git repo automatically, which was inspired by a [post on hn](https://news.ycombinator.com/item?id=24732943).

In my case, I use it to monitor the epic game store for new games, and make a commit any time a new game is detected.

However, even though my git scraping project would detect the changes and commit them, I found that I'd still miss these updates .

So, the easiest alert I thought of would be... to send myself an email. But could I do this inside the github workflow?

Yes, I could.

First, inside the workflow, a `mail.txt` needs to be assembled:

        echo 'From: "Aaron" <aaronkelly@fastmail.com>' > [mail.txt](http://localhost:8080/s?path=mail.txt&project=gitscraper)
        echo 'To: "Aaron" <aaronkelly@fastmail.com>' >> [mail.txt](http://localhost:8080/s?path=mail.txt&project=gitscraper)
        echo 'Subject: New epic games bruh' >> [mail.txt](http://localhost:8080/s?path=mail.txt&project=gitscraper)
        echo '' >> [mail.txt](http://localhost:8080/s?path=mail.txt&project=gitscraper)
        echo '[https://www.epicgames.com/store/en-US/free-games'](https://www.epicgames.com/store/en-US/free-games') >> [mail.txt](http://localhost:8080/s?path=mail.txt&project=gitscraper)

And then the `mail.txt` could be sent to my email address using some specific CURL commands:

        curl --url 'smtp://[smtp.fastmail.com](http://localhost:8080/s?path=smtp.fastmail.com&project=gitscraper):587' \
        --mail-from 'aaronkelly@fastmail.com' \
        --mail-rcpt 'aaronkelly@fastmail.com' \
        --user 'aaronkelly@fastmail.com:<APP_SPECIFIC_PASSWORD>' \
        --ssl-reqd \
        --upload-file mail.txt

In my case, I'm using values that are particular to Fastmail, and also a _Third-party apps_ password which I generated on Fastmail.

# See also

[[CURL]]