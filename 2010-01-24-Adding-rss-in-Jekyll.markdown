---
layout: post
title: Adding rss feed in Jekyll
---

Recently I wanted to add an rss feed to my Jekyll-based blog. Unfortunately there is no support for this. Quite strange...

I ended up with creating simple feed.xml to be processed with Jekyll. Once you create it, there's no need of updating when posting.

[code is here](http://pewniak747.github.com/snippets/2010/02/08/jekyll_feed.html)

Strange layout prevents from ignoring page by Jekyll, xml_escape prepares post content to be displayed in rss feed.

References: [http://www.rss-specifications.com/creating-rss-feeds.htm](http://www.rss-specifications.com/creating-rss-feeds.htm)
