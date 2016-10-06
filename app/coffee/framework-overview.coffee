class FrameworkOverview

  constructor: (requiredComponents, optionalComponents, informalName, articles) ->
    @buildLeftSection requiredComponents, optionalComponents, informalName
    @loadArticleGroups articles

  buildLeftSection : (requiredComponents, optionalComponents, informalName) ->
    data =
      requiredComponents : requiredComponents
      optionalComponents : optionalComponents
      informalName       : informalName
    $node = $ jadeTemplate['framework-overview/left-map']( data )
    $("#left").append $node
    castShadows $node
    for component, i in requiredComponents
      $box = $("#framework-map #box#{i+1}")
      $box.attr 'class', "#{$box.attr('class')} active #{component.icon}"

  loadArticleGroups : (articles) ->
    deffereds        = []
    for article, i in articles
      article.index = i
      nanobox.getYaml( "/article-groups/#{article.group}.yml", article, (yml, baseArticle)=>
        baseArticle.data = yml
        $node = $ jadeTemplate['framework-overview/article-group']( baseArticle )
        # Make sure the articles are ordered no matter wha order tyeh are loaded
        $node.css order:baseArticle.index
        $("#article-groups").append $node
        # Only applicable to local testing
        if window.isLocal
          window.localizeLinks()
      )


window.FrameworkOverview = FrameworkOverview
