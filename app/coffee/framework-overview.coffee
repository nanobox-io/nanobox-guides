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
    for article in articles
      nanobox.getYaml( "/article-groups/#{article.group}.yml", article, (yml, baseArticle)=>
        baseArticle.data = yml
        $node = $ jadeTemplate['framework-overview/article-group']( baseArticle )
        $("#article-groups").append $node
        # Only applicable to local testing
        if window.isLocal
          window.localizeLinks()
      )


    # for article in articles
    #   deffereds.push( nanobox.getYaml( "/article-groups/#{article.group}.yml", article, (yml, baseArticle)=>
    #     article.data = yml
    #   ))
    # $.when.apply($, deffereds)
    # .then ()=>
    #   console.log articles
    #   for article in articles
    #     $node = $ jadeTemplate['framework-overview/article-group']( article )
    #     $("#article-groups").append $node


window.FrameworkOverview = FrameworkOverview
