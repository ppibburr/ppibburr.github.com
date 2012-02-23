class SiteTemplate < Template
  class SiteStyle < Style
    def initialize *o
      super
      rule('.code_sample') do
        width "500px"
        height "200px"
        overflowX 'auto'
        overflowY 'auto'
        borderColor "#cecece"
        borderWidth "1px"
        borderStyle "solid"
      end
      
      rule('.news_entry') do
        width "500px"
        height "200px"
        overflowX 'auto'
        overflowY 'auto'
        borderColor "#cecece"
        borderWidth "1px"
        borderStyle "solid"
      end
      
      rule('body') do
        margin "0"
        padding "30px 0"
        font "76% tahoma,verdana,sans-serif"
        background "#047 url(images/bodybg.png) repeat-x fixed"
        color "#222"
      end

      rule('#thetop') do
        margin "0"
      end

      rule('#container') do
        width "720px"
        margin "0 auto"
        padding "20px 20px 0 20px"
        background "#fff url(images/contbg.png) no-repeat"
        color "#222"
      end

      rule('a') do
        textDecoration "none"
        backgroundColor "inherit"
        color "#26c"
      end

      rule('a:hover ') do
        textDecoration "underline"
      end

      rule('a img') do
        border "0"
      end

      rule('p') do
        margin "0 0 15px 0"
        lineHeight "1.5em"
      end

      rule('#main p,#sidebar p') do
        padding "0 0 0 10px"
      end

      rule('#logo') do
        float "left"
        width "240px"
        margin "0 20px 0 0"
        padding "0 0 25px 0"
        background "#eee"
        border "4px solid #dde"
        textAlign "center"
        color "#555"
        overflow "auto"
      end

      rule('#logo h1') do
        margin "50px 5px 1px 5px"
        letterSpacing "-3px"
      end

      rule('#logo a') do
        backgroundColor "inherit"
        color "#26a"
        textDecoration "none"
      end

      rule('#logo a:hover') do
        backgroundColor "inherit"
        color "#69e"
      end

      rule('#tagline') do
        textAlign "center"
        fontSize "1.2em"
      end

      rule('#intro p') do
        lineHeight "1.5em"
      end

      rule('#main') do
        float "left"
        width "530px"
        marginRight "20px"
        padding "0"
      end

      rule('#main h2, #main h3 ') do
        display "block"
        margin "30px 0 10px 0"
        padding "5px 0 5px 8px"
        background "#eee url(images/gradient2.png) repeat-x"
        color "#222"
        borderTop "1px solid #ddd"
        borderRight "1px solid #bbb"
        borderBottom "1px solid #bbb"
        borderLeft "1px solid #ddd"
        textDecoration "none"
      end

      rule('#sidebar') do
        width "155px"
        float "right"
        marginTop "20px"
        fontSize "1em"
        lineHeight "1.3em"
      end

      rule('#sidebar p, #sidebar .linklist ') do
        fontSize "0.9em"
      end

      rule('#sidebar ul.linklist ') do
        listStyleType " none"
        margin " 0px"
        padding " 5px 0px 5px 8px"
      end

      rule('#sidebar #menu ul ') do
        listStyleType " none"
        margin " 0px"
        padding " 0px"
      end

      rule('#sidebar #menu li a, #sidebar #menu li span, .sidelink') do
        display "block"
        width "140px"
        margin "3px 10px 2px 0"
        padding "5px 0 5px 8px"
        fontSize "1.1em"
        fontWeight "bold"
        textAlign "left"
        background "#eee url(images/gradient1.png) repeat-x"
        color "#26c"
        borderTop "1px solid #ddd"
        borderRight "1px solid #bbb"
        borderBottom "1px solid #bbb"
        borderLeft "1px solid #ddd"
      end

      rule('#sidebar #menu li a:hover, #sidebar li.webgen-menu-item-selected a, #sidebar li.webgen-menu-item-selected span, .sidelink:hover, .menuheader ') do
        background "#fff url(images/gradient2.png) repeat-x"
        color "#222"
        borderTop "1px solid #ddd"
        borderRight "1px solid #888"
        borderBottom "1px solid #888"
        borderLeft "1px solid #ddd"
        textDecoration "none"
      end

      rule('#footer') do
        margin "0 auto 20px auto"
        width "760px"
        background "#fff url(images/footerbg.png) bottom left no-repeat"
        padding "0 0 5px 0"
        fontSize "0.9em"
        color "#888"
        textAlign "center"
      end

      rule('h1,h2,h3,h4') do
        margin "0 0 10px 0"
        fontWeight "normal"
      end

      rule('h1') do
        fontSize "2.8em"
      end

      rule('h2') do
        margin "0 0 4px 0"
        fontSize "1.8em"
      end

      rule('h3') do
        margin "20px 0 8px 0"
        fontSize "1.4em"
      end

      rule('h4') do
        margin "10px 0 5px 0"
        fontSize "1.2em"
      end

      rule('.clear') do
        clear "both"
        margin "0"
      end

      rule('.right') do
        textAlign "right"
      end

      rule('.internallink') do
        fontSize "0.9em"
        textAlign "center"
      end

      rule('.block') do
        padding "20px"
        background "#eee"
        color "#222"
        border "2px solid #ddd"
      end

      rule('.credit') do
        color "#888"
        backgroundColor "inherit"
      end

      rule('.hide') do
        display "none"
      end
      
      rule('#content') do
        overflow 'auto'
        height '300px'
      end
    end
  end
end
