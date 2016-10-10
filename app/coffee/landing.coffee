class Landing

  constructor : () ->

  loadArticleGroups : (articles) =>
    @articleLoadIndexes = {}
    for article, i in articles
      article.index = i
      yamlFiles = article.group.split ","
      for item in yamlFiles
        nanobox.getYaml "/yaml/article-groups/#{item}.yml", article, @onArticleLoad

  onArticleLoad : (yml, baseArticle) =>
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


window.Landing = Landing
