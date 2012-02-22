---
layout: post
title: Navigate trough browser tabs with mouse
---

## Introduction

I got a wireless media-tech Syndic@tor mouse for xmas:) As you can see it has two extra buttons on the side, conveniently located under thumb. I was thinking how to use these cool buttons effectively.

![my-mouse](http://www.media-tech.eu/incl/mini.php?str=ZmlsZT0vdXBsb2FkL210MTA3MF8yXzAxLmpwZyZ3aWR0aD0xMjAwJmhlaWdodD0xMDYzJm1vZGU9bWluaQ==)

At first I used them to switch to next/previous desktop on my GNOME environment. But I didn't need it that much. Then I got an idea - switching tabs in firefox!

I created two simple scripts that send signals of keys being pressed. Ctrl+Tab is a shortcut for next tab, Ctrl+Shift+Tab for previous (it works on all popular browsers). Then I connected these scripts to mouse buttons, like shortcuts.

## Prepare

We'll need a _xsendkeycode_ program. I assume you don't have it on your linux desktop, so download it form repositories.

{% highlight bash %}
$ sudo apt-get install xsendkeycode
{% endhighlight %}

## Write scripts

Create these two scripts in a safe place:

ff_nexttab.sh

{% highlight bash %}
#!/bin/bash

xsendkeycode 37 1
xsendkeycode 23 1
xsendkeycode 23 0
xsendkeycode 37 0

{% endhighlight %}

ff_prevtab.sh

{% highlight bash %}
#!/bin/bash

xsendkeycode 37 1
xsendkeycode 50 1
xsendkeycode 23 1
xsendkeycode 23 0
xsendkeycode 50 0
xsendkeycode 37 0

{% endhighlight %}

Xsendkeycode sends key-pressed or key-released signal. 37 means LCtrl, 23 is Tab ans 50 RShift. 1 means press, 0 release. Can you see your browser's shortcuts now?

Make both scripts executable!

{% highlight bash %}
$ chmod +x ff_nexttab.sh
$ chmod +x ff_prevtab.sh
{% endhighlight %}

## Connect

Connecting scripts to mouse keys differs on various environments. I use GNOME with Compiz.

So, open up CompizConfig and navigate to "General -> Commands". In fields 1 and 2 type absolute paths to your scripts, ie.

{% highlight bash %}
/home/pewniak747/Scripts/ff_nexttab.sh
{% endhighlight %}

Then, go to tab "mouse shortcuts" and set fields 1 and 2 to your mouse buttons. In my case these are buttons 8 and 9.

Voila! Enjoy surfing the internet with mouse in your hands!
