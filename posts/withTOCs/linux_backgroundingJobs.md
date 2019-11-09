
Table of Contents
=================



Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



---
layout: post
title: Linux - Backgrounding jobs
date:   2019-08-10
categories: linux background jobs batch video conversion nohup
---

Yes there is the method of using `CTRL+Z`, `bg`, `fg`, `jobs`...

But by far the best solution I have for running long-running jobs in the
background is this:
```
nohup ./encode.sh &> log.log &
```

Explanation:
- `nohup` - allows a process to continue running in the background even after a user
exits the shell.
- `./encode.sh` - the script that is being run
- `&> log.log` redirect all STDOUT/STDERR to a logfile
- `&` - put the process in the background

Benefits:
- the logfile can be tailed
- the process can be viewed using a utility such as _top_

Killing a nohup job can sometimes be tricky, using `kill [PID]` won't work.
Instead, list the jobs that are running by typing `jobs`, then kill the
job number by typing `kill %[JOB_NUMBER]`