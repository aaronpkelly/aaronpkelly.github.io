

For a long time I've been annoyed that there was no way to easily collapse all hackernews threads on a single page. I went looking for an extension and didn't find one, so I decided just to bite the bullet and see if I could write some simple Javacript to do it.

And as it turns out, it wasn't too hard!

# Designing and testing a bookmarklet

Here's my first prototype:

```
javascript: var list = document.getElementsByClassName('togg');
for (let item of list) {
    item.click();
}
```

All that incredibly fast clicking was just too much for the page. I noticed in the console that a lot of the clicks were lost due to `503 (Service Temporarily Unavailable)`, and the script caused the browser to hang.

Also, I noticed that I was telling the browser to collapse EVERY comment in a thread, which was probably overkill. For large threads there would be a _LOT_ of comments. Could I narrow down my results somehow?

How about..  just getting the top comment of every thread - could I identify these somehow? Well... indentation might be a good start. And it looked like an image with 0 height was used to do the indentation. So, if I wanted to determine if a comment was the 'top' one, the 'width' attribute would be 0:

```
javascript: var topComment = [];
var list = document.getElementsByClassName('togg');
for (let item of list) {
    if (item.parentElement.parentElement.parentElement.parentElement.getElementsByTagName('img')[0].width == 0) topComment.push(item)
};
for (let item of topComment) {
    item.click();
}
```

Top comments only are now identified - seems good! However, even with reduced results, the clicking was just too fast. So, what about adding a timer?:

```
var TIMER_WAIT = 1000;
var timer = 0;
var topComment = [];
var list = document.getElementsByClassName('togg');
for (let item of list) {
    if (item.parentElement.parentElement.parentElement.parentElement.getElementsByTagName('img')[0].width == 0) topComment.push(item)
};
for (let item of topComment) {
    setTimeout(() => {
        console.log("toggling comment by " + item.parentNode.getElementsByClassName('hnuser')[0].innerText);
        item.click();
    }, timer + TIMER_WAIT);
    timer = timer + TIMER_WAIT;
}
```

Yep, it's definitely slower - but it ensures that every top comment is clicked successfully.

# The final bookmarklets

Create a new bookmark on your bookmark bar, and for the URL field, add one of the following. They're the same script as above but with no newlines. You can then click the bookmarklet anytime to begin collapsing comments.

Note: Open your console to see the hackernews username of the commenter being collapsed as it happens. If your internet connection is faster than mine, you can even try reducing the value of the `TIMER` variable to collapse comments faster - just make sure your not receving any request timeouts, otherwise the comment won't be collapsed.

## Collapse TOP comment only

```
javascript: var TIMER_WAIT = 1000; var timer = 0; var topComment = []; var list = document.getElementsByClassName('togg'); for (let item of list) { if (item.parentElement.parentElement.parentElement.parentElement.getElementsByTagName('img')[0].width == 0) topComment.push(item) }; for (let item of topComment) { setTimeout(() => { console.log("toggling comment by " + item.parentNode.getElementsByClassName('hnuser')[0].innerText); item.click(); }, timer + TIMER_WAIT); timer = timer + TIMER_WAIT; }
```

## Collapse ALL comments

This is the same script as my prototype, but with a timer added:

```
var TIMER_WAIT = 1000; var timer = 0; javascript: var list = document.getElementsByClassName('togg'); for (let item of list) { setTimeout(() => { console.log("toggling comment by " + item.parentNode.getElementsByClassName('hnuser')[0].innerText); item.click(); }, timer + TIMER_WAIT); }
```