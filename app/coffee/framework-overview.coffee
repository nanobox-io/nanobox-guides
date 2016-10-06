class FrameworkOverview

  constructor: (requiredComponents, optionalComponents, informalName, articles) ->
    @buildLeftSection requiredComponents, optionalComponents, informalName
    @loadArticleGroups articles

  buildLeftSection : (requiredComponents=[], optionalComponents=[], informalName) ->
    data =
      requiredComponents : requiredComponents
      optionalComponents : optionalComponents
      informalName       : informalName
    $node = $ jadeTemplate['framework-overview/left-map']( data )
    $("#left").append $node
    castShadows $node

    # In the svg, highlight any active components
    for component, i in requiredComponents
      $box = $("#framework-map #box#{i+1}")
      $box.attr 'class', "#{$box.attr('class')} active #{component.icon}"

    $(".component").on 'click', (e)=>
      $component = $(e.currentTarget)
      @showServiceCard $component.attr('id'), $('.txt', $component).text()

  showServiceCard : (serviceId, name) ->
    nanobox.getYaml "/yaml/services/snippets/#{serviceId}.yml", null, (yaml)=>
      if @$serviceCard? then @$serviceCard.remove()
      yaml.service = serviceId
      yaml.name    = name
      @$serviceCard = $ jadeTemplate['framework-overview/service-card']( yaml )
      @$serviceCard.css opacity:0
      @$serviceCard.velocity {opacity:1}, {duration:200}
      $("#left").append @$serviceCard
      castShadows @$serviceCard
      Prism.highlightElement($("pre",@$serviceCard)[0])
      $(".close", @$serviceCard).on 'click', ()=>
        @$serviceCard.velocity {opacity:0}, duration:300, complete:()=>
          @$serviceCard.remove()
      # Only applicable to local testing
      if window.isLocal
        window.localizeLinks()

  loadArticleGroups : (articles) ->
    @articleLoadIndexes = {}
    for article, i in articles
      article.index = i
      yamlFiles = article.group.split ","
      for item in yamlFiles
        nanobox.getYaml "/yaml/article-groups/#{item}.yml", article, @onArticleLoad

  onArticleLoad : (yml, baseArticle)=>
    addToExisting = @articleLoadIndexes[baseArticle.index]?

    baseArticle.data = yml
    data = {info:baseArticle}

    if addToExisting
      data.isChild = true
    else
      @articleLoadIndexes[baseArticle.index] = ""

    $node = $ jadeTemplate['framework-overview/article-group']( data )
    # Make sure the articles are ordered no matter wha order tyeh are loaded
    $node.css order:baseArticle.index

    if addToExisting
      $("#article-groups #group#{baseArticle.index}").append $node
    else
      $("#article-groups").append $node

    # Only applicable to local testing
    if window.isLocal
      window.localizeLinks()

window.FrameworkOverview = FrameworkOverview
