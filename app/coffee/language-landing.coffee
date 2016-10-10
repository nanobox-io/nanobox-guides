class LanguageLanding extends Landing

  constructor: (articles, language) ->
    super()
    @loadArticleGroups articles
    @loadFrameworks language

  loadFrameworks : (language) ->
    nanobox.getYaml "/yaml/frameworks/#{language}.yml", null, (yaml)=>
      $node = $ jadeTemplate['language-overview/frameworks']( yaml )
      $("#frameworks-holder").append $node
      castShadows()
      if window.isLocal
        localizeLinks()

window.LanguageLanding = LanguageLanding
