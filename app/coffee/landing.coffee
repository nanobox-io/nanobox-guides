class Landing

  constructor : () ->

  loadArticleGroups : (articles) =>
    return if !articles?
    return if articles.length == 0
    nanobox.getYaml "/yaml/article-groups/#{articles}.yml", null, @onNavLoad

  onNavLoad : (yaml)=>
    for group in yaml.articles
      $node = $ jadeTemplate['framework-overview/article-group']( group )
      $("#article-groups").append $node

    # Only applicable to local testing
    if window.isLocal
      window.localizeLinks()


window.Landing = Landing
