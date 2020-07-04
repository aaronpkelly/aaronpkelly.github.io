<div id="archives">
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
</div>

source: https://blog.webjeda.com/jekyll-categories/