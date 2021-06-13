"Programs must be written for people to read and only incidentally for machines to execute" - (SICP)

Howdy, I’m Aaron. I do a bit of coding... a bit of hacking... and a bit of the ol' breaking-things-and-putting-them-back-together

![avatar](https://avatars1.githubusercontent.com/u/29888436?s=460&u=03df457371669048031a735802c33b93d07a1f10&v=4)

{% assign numPostsFound = 0 %}

# Latest post

<ul>
{% for post in site.posts %}
    {% unless post.content contains 'DISABLE_FROM_FRONT_PAGE_POST' %} 
        {% assign numPostsFound = numPostsFound | plus: 1 %}
        {% if numPostsFound == 1 %}
            <li>
                <a href="{{ post.url }}">{{ post.title }}</a>
            </li>
        {% endif %}
        
        </ul>

        # Recent posts

        <ul>

        {% if numPostsFound > 1 %}
            <li>
                <a href="{{ post.url }}">{{ post.title }}</a>
            </li>
        {% endif %}
    {% endunless %}
</ul>
{% endfor %}

You can also view the complete <a href="https://aaronpkelly.github.io/PostIndex.html">post index</a>, posts by <a href="https://aaronpkelly.github.io/Categories.html">category</a> or <a href="https://aaronpkelly.github.io/Tags.html">tag</a>. If you want the RSS feed - it's [here](https://aaronpkelly.github.io/feed.xml).
