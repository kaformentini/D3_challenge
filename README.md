# README

Nese aplicação você encontrará desafios de programação.

**WebCrawler - D3**
    Aplicação que, dado uma determinada url, devolverá um objeto JSON contendo as páginas do domínio, e o conteúdo de alguns assets staticos (css, js, img) de cada página.

    Essa função percorre todos os links contidos nas páginas, faz uma seleção das páginas do próprio domínio, salvando em um hash cada links e seus staticos;

    - Ruby, versão: 2.6.3
    - gem Nokogiri
    
    - Exemplo formato do JSON:
    
    [{"https://elixir-lang.org":["http://feeds.feedburner.com/ElixirLang","/css/style.css","/css/syntax.css","/js/icons/style.css","/js/icons/ie7/ie7.css","//fonts.googleapis.com/css?family=Bitter:400,700","/favicon.ico","/opensearch.xml","https://www.googletagmanager.com/gtag/js?id=UA-8268430-6","https://elixir-lang.org/","/images/logo/logo.png","/images/contents/home-code.png","/images/logo/eef.png","/images/logo/plataformatec.png","//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js","/js/toc/toc.js"]}]
