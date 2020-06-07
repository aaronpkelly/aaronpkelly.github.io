---
title: Glossary
description: great explanations for common but confusing terms
date: 2020-01-31
tags:
    - CORS
---

# Glossary

The following are great explanations I've found on the internet for common but confusing terms.

# CORS

It says that a CORS error has occurred, and that's because the front-end and back-end are hosted under different domain or ports if on localhost, lets explain this a little bet further.

CORS which stands for Cross Origin Resource Sharing is a security policy that applies only to Javascript (Browsers) that blocks websites from accessing other websites using AJAX unless they are explicitly approved using headers.

To solve this, you need to pass certain headers in the response from the server side that approves CORS for the requesting domain, headers & methods

You can read this article for deep knowledge about CORS Or you can check this link to know how to solve the issue your facing

[source](https://stackoverflow.com/questions/55673803/typeerror-networkerror-when-attempting-to-fetch-resource)