---
title: Indexing an 8GB MBOX file
description: A post series on how I indexed an 8GB MBOX file
date: 2020-03-01
tags:
    - mbox
    - export
    - indexing
    - search
    - meilisearch
    - elasticsearch
    - aws
    - elasticache
    - google
---

# Indexing an 8GB MBOX file

This is a post series on how I exported, converted, and made searchable a
gigantic mailbox, containing ~15 years worth of email and attachments.

To do this, I make use of a number of techniques in the following posts. I've placed them in a logical order here, but they can also be read individually:

[Exfiltrating data from cloud services]({% 2020-03-02-Exfiltrating-data-from-cloud-services %})

[[Journey to the Center of the MBOX]]

[Sorting and formatting MBOX output]({% 2020-03-04-Sorting-and-formatting-MBOX-output %})

[Preparing text files for indexing]({% 2020-03-05-Preparing-text-files-for-indexing %})

[Searching for an email indexing tool]({% 2020-03-06-Searching-for-an-email-indexing-tool %})