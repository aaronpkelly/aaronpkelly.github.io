"Programs must be written for people to read and only incidentally for machines to execute" - (SICP)

Howdy, I’m Aaron. I do a bit of coding... a bit of hacking... and a bit of the ol' breaking-things-and-putting-them-back-together

![avatar](https://avatars1.githubusercontent.com/u/29888436?s=460&u=03df457371669048031a735802c33b93d07a1f10&v=4)

{% assign numPostsFound = 0 %}
{% assign maxPosts = 6 %}

# Latest post

<ul>
{% for post in site.posts %}
    {% unless post.content contains 'DISABLE_FROM_FRONT_PAGE_POST' %} 
        {% assign numPostsFound = numPostsFound | plus: 1 %}
        {% if numPostsFound == 1 %}
    <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
</ul>

# Recent posts

<ul>
        {% elsif numPostsFound > 1 %}
    <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
        {% endif %}
    {% endunless %}
    {% if numPostsFound == maxPosts %}
        {% break %}
    {% endif %}
{% endfor %}
</ul>

You can also view the complete <a href="https://aaronpkelly.github.io/PostIndex.html">post index</a>, posts by <a href="https://aaronpkelly.github.io/Categories.html">category</a> or <a href="https://aaronpkelly.github.io/Tags.html">tag</a>. If you want the RSS feed - it's [here](https://aaronpkelly.github.io/feed.xml).

# Contact

email: aaronkelly@fastmail.com

twitter: https://twitter.com/aaronpaulkelly

linkedin: https://www.linkedin.com/in/aaronpaulkelly/

bandcamp: https://aaronkelly.bandcamp.com/

steam: https://steamcommunity.com/id/Vorophobe/

# Donate

If you've found anything here useful, please consider my caffeine levels:

<a href="https://www.buymeacoffee.com/aaronkelly" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/arial-red.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

# About this blog

See the <a href="https://aaronpkelly.github.io/About.html">About</a> article