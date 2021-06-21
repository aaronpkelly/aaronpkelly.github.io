---
title: Running GeForce Now on Linux
description:
date: 2020-02-09
tags:
  - gaming
---

# Running GeForce Now on Linux
## ChromeOS - the best option
They just released GeForce Now for Chromebooks (ChromeOS).

Just change your user agent in Chrome to `Chrome OS` and you can play on any Chrome browser!

You can also set it permanently by starting chrome with the `--user-agent` parameter, and the user agent string for Chrome os, which is `Mozilla/5.0 (X11; CrOS x86_64 10066.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36`:

```
chrome --user-agent='Mozilla/5.0 (X11; CrOS x86_64 10066.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36'
```



# Emulation
See [[running android apps on Linux]]

# Hardware (Android Phone)

I have a spare Android Phone (Samsung Galaxy J36), and as Android is one of the [supported devices](https://www.nvidia.com/en-eu/geforce-now/download/) I thought I'd try doing the following:

- run GeForce Now on Android
- on my Linux machine, use _Steam Remote Play_ to connect to the Steam instance that's running inside my Android phone

When I went to download the app on the Play Store, it said my device wasn't supported. This is a shame as the phone was only released in 2016!

There is an alternative: install the application as an APK, however this will be considered an untrusted source. I don't care though, I won't be using this phone for anything else.