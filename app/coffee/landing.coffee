class Landing

  constructor : () ->

  loadArticleGroups : (articles) =>
    return if !articles?
    return if articles.length == 0
    nanobox.getYaml "/yaml/article-groups/#{articles}.yml", null, @onNavLoad

  onNavLoad : (yaml)=>
    return if !yaml?
    for group in yaml.articles
      if group.tribe?
        @createTribeHolder group.tribe
        tribe = group.tribe
      else
        tribe = 'everything'
      $node = $ jadeTemplate['framework-overview/article-group']( group )
      $("##{tribe}-tribe").append $node

    # Only applicable to local testing
    if window.isLocal
      window.localizeLinks()

  createTribeHolder : (tribe) ->
    if $("##{tribe}-tribe").length == 0
      $node = $ jadeTemplate['framework-overview/tribe']( {id:"#{tribe}-tribe", title:tribe.replace("_", " ")} )
      $("#article-groups").prepend $node

window.Landing = Landing
