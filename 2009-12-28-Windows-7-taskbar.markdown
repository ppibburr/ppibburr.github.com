---
layout: post
title: Windows 7-like window list in GNOME
---
How to get a window list that displays icons only in GNOME? Easy:)

* Go [there](http://ubuntu-ky.ubuntuforums.org/showthread.php?t=986338) and download taskdock-0.0.2.tar.gz (attachment to the first post). You must register on ubuntuforums, but that's painless.

* Install dependencies: libpanelappletmm-2.6-dev and libwnck-dev from repositories

* Extract the .tar.gz file and go there in terminal.
	{% highlight bash%}
$ cd path/to/dir
$ make
$ sudo make install
{% endhighlight %}

* right-click on your gnome-panel, add taskdock and enjoy!:)

![Windows 7 taskbar](http://img684.imageshack.us/img684/6342/windows7taskbarliveprev.jpg)

![GNOME taskdock](http://img684.imageshack.us/img684/7967/windows7taskbargnomepre.jpg)
