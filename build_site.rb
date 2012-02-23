require './web_site_generator'
require './ruby_js_template'
require './ruby_js_template_style'
require 'coderay'

class SitePage < Page
  TEMPLATE = SiteTemplate
  attr_accessor :page_title,:site_title,:tagline,:overview,:overview_header
  def initialize *o
    super
    @menu_index = 0 
    @site_title = "RubyJS"
    @page_title = @site_title
    @tagline = "A bridge to JavaScript"
    @overview_header = "Ruby + JSCore + HTML5"
    @overview = "A library providing ruby bindings to JavaScript, JavaScript bindings to ruby and a HTML5 framework via WebKitGTK"
    @links = {"RubyJS @ GitHub"=>"http://github.com/ppibburr/ruby_js","google"=>"http://google.com","Gtk"=>"http://gtk.org","WebKitGTK"=>"http://http://webkitgtk.org/"}
  end
  
  def set_index i
    @menu_index = i
  end
  
  def nav_bar ele
    ele.innerHTML = ""
    pg_i = @menu_index
    pages = ["Home","News","Samples","Readme","Download"]
    build ele do
      pages.each_with_index do |pg,i|
        is_sel = ""
        is_sel = "webgen-menu-item-selected" if pg_i == i
        li("class"=>"webgen-menu-level1"+is_sel) do
          if pg_i == i
            span do
              text pg
            end
          else
            q = pg.downcase
            q = "index" if q == "home"
            a('href'=>"#{q}.html") do
              text pg
            end
          end
        end
      end
    end
  end
  
  def related ele
    links = @links
    ele.innerHTML = ''
    build ele do
      links.each_pair do |key,value|
        li() do
          a("href"=>value) do text key end
        end
      end
    end
  end
  
  def logo_link ele
    title = @site_title
    build ele do
      href "index.html"
      self.innerText = title
    end
  end
end

class Home < SitePage
  def content
    <<-EOC
    <p>
      RubyJS is a library that uses FFI to provide bindings to 
    JavaScript and WebKit from libwebkitgtk-1.0 (WebKit), 
    allowing Full access to JavaScript and any JavaScript library
    as well as full WebKit api access. 
    </p><p>
      This library enables ruby scripts to create JS objects, 
    call functions, get/set properties, create callbacks. 
    As well, JavaScript scripts can call ruby methods, access objects.
    </p><p>
      Using Gtk2 you can embed a WebKit::WebView 
    and develop HTML5 desktop applications
    </p><p>
    This site was infact <a href="sitegen.html">built</a> using RubyJS
    </p>
    EOC
  end
  
  def file_name
    "index.html"
  end
  
  def content_header ele
    ele.innerHTML=""
    build ele do
      text "About "
      em do
        text "RubyJS"
      end
    end
  end
end

class News < SitePage
  def content_header
    "Recent News"
  end
  def content ele
    ele.innerHTML = ""
    build ele do
      Dir.glob("./news/*.txt").each do |f|
        div("class"=>"news_entry_header") do
          text File.basename(f).gsub(/\..*/,'').gsub("_",' ')
        end
        p("class"=>"news_entry") do
          text File.read(f)
        end
      end
    end
  end
end

class SiteGen < SitePage
  def content_header
    "Static WebSites written in Ruby via <em>RubyJS</em>"
  end
  
  def content
    CodeRay.scan(File.read(__FILE__), :ruby).div(:line_numbers => :table)
  end
end

class Samples < SitePage
  def content_header
    "Some informative samples"
  end
  def content ele
    ele.innerHTML = ""
    build ele do
      Dir.glob("./samples/*.rb").each do |f|
        a("href"=>f) do text "#{File.basename(f)}" end
        div("class"=>"code_sample") do
          self.innerHTML=CodeRay.scan(File.read(f), :ruby).div(:line_numbers => :table)
        end
      end
    end
  end
end

class Readme < SitePage
  def content_header
    "README"
  end
end

class Download < SitePage
  def content_header
    "Installing RubyJS"
  end
end

class BuildSite < JS::Application
  def on_render
    pages = [Home,News,Samples,Readme,Download,SiteGen].map do |klass|
       pg = klass.new(document)
       pg.page_title = pg.page_title + ": #{klass.name}"
       pg.file_name = klass.name.downcase+".html"
       pg
    end
    pages.each_with_index do |pg,i|
      pg.set_index i
      File.open(File.join('ruby_js',pg.file_name),'w') do |f|
        f.puts pg.to_s
      end
    end
  end
end

File.open("./news/site_build_#{Time.now.to_s.split(" ")[0..1].join("_")}.txt","w") do |f| f.puts("Another Site Build") end

BuildSite.new.run
