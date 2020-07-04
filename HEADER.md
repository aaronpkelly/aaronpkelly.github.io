Howdy, I'm Aaron - and I'm _really_ good at breaking things. Occasionally... I'll even put them back together.

![avatar](https://avatars1.githubusercontent.com/u/29888436?s=460&u=03df457371669048031a735802c33b93d07a1f10&v=4)

# Latest post

<ul>
  {% for post in site.posts limit:1 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

# Previous posts

<ul>
  {% for post in site.posts limit:5 offset:1 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

You can also view the complete <a href="https://aaronpkelly.github.io/PostIndex.html">post index</a>, posts by <a href="https://aaronpkelly.github.io/Categories.html">category</a> or <a href="https://aaronpkelly.github.io/Tags.html">tag</a>, and if you want the RSS feed, it's [here](https://aaronpkelly.github.io/feed.xml).
