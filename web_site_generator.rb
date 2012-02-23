require 'JS/application'
class Template
  attr_reader :document,:style
  HTML = "<head><title class=page_data id=page_title></title><style type=text/css></style></head><body></body>"
  def initialize document,page=nil
    page = Page.new(document,self.class) if !page
    @page = page
    document.getElementsByTagName('html')[0].innerHTML = self.class::HTML
    @document = document
  end
  
  def use_style sty
    @style = sty
  end
  
  def build ele=document.body,&b
    JS::DOM::Builder.build(document.context.get_global_object,ele,&b)  
  end
  
  def to_s
    @style.element.childNodes.length.times do
      @style.element.removeChild( @style.element.firstChild )
    end if @style.element.hasChildNodes
    for i in 1..@style.rules.length
        k = document.createTextNode('');
        @style.element.appendChild(k)
        k.nodeValue = @style.rules[i-1].cssText
    end
    for i in 0..(els=document.getElementsByClassName("page_data")).length-1
      ele=els[i]
      if @page.respond_to?(ele.id.to_sym)
        if @page.method(ele.id.to_sym).arity == 0
          ele.innerHTML = @page.send(ele.id)
        else
          @page.send(ele.id.to_sym,ele)
        end
      end
    end
    document.documentElement.outerHTML
  end
  
  class Style
    class Builder
      def initialize sty
        @style = sty
      end
      undef :display
      def method_missing m,o
        @style[m]=o
      end
    end
    attr_reader :element,:document,:sheet
    def initialize document
      @document = document
      @sheet = document.styleSheets[document.styleSheets.length - 1]; 
      @element = document.getElementsByTagName('style')[0]
    end
    
    def rules
      a=[]
      for i in 1..sheet.rules.length
        a << sheet.rules.item(i-1)
      end
      a    
    end
    
    def has_rule?(r)
      rules.find do |st| st.selectorText == r end
    end
    
    def rule r,&b
      if !rl=has_rule?(r)
        sheet.insertRule(q="#{r} {}",0)
        rl=sheet.rules[0]
      end
      Builder.new(rl.style).instance_eval &b
      r
    end
  end  
end

class Page
  TEMPLATE = Template
  attr_reader :document,:page_title
  attr_writer :file_name
  def initialize document,template=self.class::TEMPLATE
    @template_class = template
    @document = document
    @page_title = "A WebSite Page"
  end
  
  def file_name
    @file_name||@page_title.gsub(" ","_").gsub("-",'_').gsub("::","_")+".html"
  end
  
  def build parent,&b
    JS::DOM::Builder.build(document.context.get_global_object,parent,&b)
  end
  
  def to_s
    @template_class.new(document,self).to_s
  end
end

if __FILE__ == $0
class MyApp < JS::Application
  class MyTemplate < Template
    class MyStyle < Style
      def initialize *o
        super
        rule "#content" do 
          backgroundColor "red"
        end
        
        rule "#header" do
          color "green"
        end
      end
    end
    
    def initialize *o
      super
      
      use_style MyStyle.new(document)
      
      build do
        h1 'id'=>"header","class"=>"page_data" do
          text "change the header"
        end
        table "valign"=>"top" do
          tr do
            td "valign"=>"top" do
              div "class"=>"page_data","id"=>"links" do
                html = ""
                3.times do
                  html = html + "<a href=http://google.com>google</a><br>"
                end
                innerHTML html
              end
            end
            td "valign"=>"top","class"=>"foo page_data","id"=>"content" do
              text "change the content"
            end
          end
        end
      end
    end
  end
  
  class MyPage < Page
    TEMPLATE = MyTemplate
    attr_accessor :title,:content,:header
    def initialize *o
      super
      @title = "A WebSite"
      @header = "Page header"
      @content = "<code><pre>#{File.read(__FILE__)}</code></pre>"
      @links = {"google"=>'http://www.goole.com','Gtk'=>"http://www.gtk.org"}
    end
    def links parent
      links = @links
      build(parent) do
        links.each_pair do |key,value|
          div do
            a 'href'=>value do
              text key
            end
          end
        end
      end
    end
  end
  
  def on_render
    pages = []
    for i in 0..2
       pg = MyPage.new document
       pages << pg
       pg.title = pg.title+": Page #{i}"
       pg.header = pg.header+" for page #{i}"
    end
    out = pages.map do |pg| pg.to_s end
    puts out.join("\n\n")
  end
end

MyApp.new.run
end
