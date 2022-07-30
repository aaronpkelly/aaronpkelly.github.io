---
title: Journey to the center of the MBOX
description:
date: 2020-03-03
tags:
  - mbox
---

# Exporting the MBOX contents

The contents of MBOX files are just plain text, which has advantages:

- linux tools like grep, sed and awk are designed to work very efficiently with
plain text

and disadvantages:

- embedded information, like email attachments, is not immediately readable
- the file is huge - 8GB, 250,000+ messages. It takes a long time to download
AND search, and even then, my search is limited to plain text

There must be a better way to index this MBOX file!

## Naiively working with MBOX contents using popular email clients

I've looked to some email clients to see how good their MBOX support was, and
whether they offered tools to easily work with them.

### Claws Mail

I tried Claws Mail, and although initially it was able to index all the email and
present a search interface, it choked heavily whenever I tried to
search it. I never completed a successful search.

### Thunderbird

Next up, Thunderbird, and I struggled to find out how to import a MBOX at all in the first place (it's an addon, ImportExportTools NG).
Also, when I finally installed it, when clicking the _Import mbox file_ item, it did nothing. Turned out I had to setup an email accound first, in order
to access the _Local folders_ screen.

After the import finished, the search seemed to work, and I was able to sort the email items fairly quickly. Performance seemed good!

It offered the ability to export all messages as plain text+attachments, which was great. My first export failed at 240/250k mails though, which was very
annoying! I struggled to make any progress until I refined my export settings, by exporting a new MBOX file per-year into its own folder. this
way I'd be breaking the problem up into smaller chunks.

