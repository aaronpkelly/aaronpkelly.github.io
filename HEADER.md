Howdy, I'm Aaron - I'm really good at breaking things. Occasionally... I learn something in the process!

![avatar](https://avatars1.githubusercontent.com/u/29888436?s=460&u=03df457371669048031a735802c33b93d07a1f10&v=4)

# What's here? Posts. Lots of them

I like to write about my tech experiences *a lot*, so posts are the the main focus of my website. If you want the RSS feed, it's [here](https://aaronpkelly.github.io/feed.xml).

# Post index

{% link /Categories.html %}

{% link /Tags.html %}

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

# My non-Jekyll generated post index
