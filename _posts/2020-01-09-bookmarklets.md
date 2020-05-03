For a long time I've been annoyed that there was no way to easily collapse all hackernews threads on a single page. I went looking for an extension and didn't find one, so I decided just to bite the bullet and see if I could write some simple Javacript to do it.

And as it turns out, it's pretty easy!:

```
javascript:var list = document.getElementsByClassName('togg'); for (let item of list) { item.click(); }
```

You can either manually create a new bookmark and add the above as it's URL, or if your browser supports it, you can drag [this link](javascript:var list = document.getElementsByClassName('togg'); for (let item of list) { item.click(); }) to your bookmark bar.