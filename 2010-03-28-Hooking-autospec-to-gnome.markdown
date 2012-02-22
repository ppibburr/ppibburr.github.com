---
layout: post
title: Hooking autospec to GNOME notifications
---

I was using [rspec][1] to automate my tests, while writing [snippet-gem][2]. I strongly recommend this great tool!

The problem was i had to look at the terminal all the time to check if my tests have passed. I found a nice way to hook it to GNOME notifications. It looks like this:

![notification](http://i40.tinypic.com/dp9374.png)

To achieve this, create a new file in your home directory, called .autotest, and fill in this code:

{%  highlight ruby %}
#!/bin/ruby
require 'redgreen'
require 'autotest/timestamp'
 
module Autotest::GnomeNotify
  def self.notify title, msg, img
    system "notify-send '#{title}' '#{msg}' -i #{img} -t 3000"
  end
  Autotest.add_hook :ran_command do |at|
    image_root = "~/.autotest_images" 
    results = [at.results].flatten.join("\n")
    results.gsub!(/\\e\[\d+m/,'')
    output = results.slice(/(\d+)\sexamples?,\s(\d+)\sfailures?/)
    puts output.inspect
    if output
      if $~[2].to_i > 0
        notify "FAIL", "#{output}", "#{image_root}/fail.png"
      else
        notify "Pass", "#{output}", "#{image_root}/pass.png" 
      end
    end
  end
end
{% endhighlight %}

You should also install a redgreen gem:

{% highlight bash %}
$ gem install redgreen
{% endhighlight %}

In .autotest_images/ directory paste some icons for fail.png and pass.png. [Iconspedia][3] is my favourite source of  icons.

Now you can enjoy running autospec with system notifications!

Found [here](http://automate-everything.com/2009/08/gnome-and-autospec-notifications/)

[1]: http://rspec.info
[2]: http://github.com/pewniak747/snippet-gem
[3]: http://iconspedia.com
