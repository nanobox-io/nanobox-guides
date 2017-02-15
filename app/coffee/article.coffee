class Article

  constructor: (@title, @clusters, @id) ->
    @$main    = $ ".main"
    @$leftNav = $ "#left-nav"
    @buildRelatedPagesNav()
    @buildPageNav()

  # Build the nav in the upper left hand that shows the related articles
  buildRelatedPagesNav : () ->
    store = {}
    $.when(
      nanobox.getYaml( "/yaml/article-groups/#{@clusters}.yml", null, (yml)=>
        @articleGroupData = yml
      )
    ).then ()=>
      @markMatchedArticle @articleGroupData.articles
      $node = $ jadeTemplate['articles']( @articleGroupData )
      $(".title",    @$leftNav).text @articleGroupData.title
      $(".title",    @$leftNav).attr 'href', @articleGroupData.href
      $(".articles", @$leftNav).append $node

      # click on a parent node
      $("a.trigger", $node).on 'click', (e)->
        e.stopPropagation()
        e.preventDefault()
        $($(e.currentTarget).parent()).toggleClass 'open'
      # mouseover / mouseout on a parent node
      $("a.trigger", $node).on 'mouseover', (e)->
        $($(e.currentTarget).parent()).addClass 'hover'
      $("a.trigger", $node).on 'mouseout', (e)->
        $($(e.currentTarget).parent()).removeClass 'hover'

      @buildBreadCrumbs()
      if window.isLocal
        localizeLinks()

  markMatchedArticle : (articles) ->
    shouldBeOpen = false
    foundActiveArticle = false
    for article in articles
      if article.title.toLowerCase() == @id.toLowerCase()
        article.active = true
        foundActiveArticle = true
      if article.articles?
        shouldBeOpen = @markMatchedArticle article.articles
        if shouldBeOpen
          article.isOpen = true
    return shouldBeOpen || foundActiveArticle


  buildBreadCrumbs : () ->
    return
    @articleGroupData.breadCrumb.push {title:@title, href:"#"}
    $node = $ jadeTemplate['breadcrumb']( {breadCrumbs:@articleGroupData.breadCrumb} )
    @$main.prepend $node

  # Dynamically build the page `header` navication
  buildPageNav : () ->
    ar = []
    $headers = $("h1, h2, h3, h4, h5, h6", @$main )

    return if $headers.length < 2

    # Find all the headers on the page and
    #  1) remove their text, and add an anchor
    #  2) copy their data into an array for building a page navigation
    for header in $headers
      $header = $ header
      data = {id:$header.attr('id'), text:$header.text(), tag:$header.prop("tagName").toLowerCase()}
      $header.text('')
      $header.append "<a href='##{data.id}'>#{data.text}</a>"
      ar.push data


    $node = $ jadeTemplate['page-nav']( {headers:ar} )
    $("#left-nav").append $node

    # Smoothly scroll any anchor clicks
    $("a", $node).on 'click', @onAnchorClick
    $("a", $headers).on 'click', @onAnchorClick

  onAnchorClick : (e)->
    $('body').velocity 'scroll', {duration:600, offset:$($.attr(this, 'href')).offset().top, easing:'easeInOutQuint' }


window.nanobox ||= {}
nanobox.Article = Article
