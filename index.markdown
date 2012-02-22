---
title: Blog
layout: main
class: blog
---

{% for post in site.categories.blog limit:1 %}
## [Latest: {{ post.title }}]({{ post.url }})
{% endfor %}

{% for post in site.categories.blog %}* {{ post.date | date: '%d %b %Y' }} [{{ post.title }}]({{ post.url }} "{{post.title }}") 
{% endfor %}
