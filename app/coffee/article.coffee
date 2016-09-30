class Article

  constructor: (@title, @clusterId) ->
    @buildRelatedPagesNav()
    @buildPageNav()
    @buildBreadCrumbs()

  # Build the nav in the upper left hand that shows the related articles
  buildRelatedPagesNav : () ->
    for article in window.articleGroupData.articles
      if article.title == @title
        article.active = true

    $node = $ jadeTemplate['articles-nav']( articleGroupData )
    $("#left-nav").append $node

  buildBreadCrumbs : () ->
    articleGroupData.breadCrumb.push {title:@title, href:"#"}
    $node = $ jadeTemplate['breadcrumb']( {breadCrumbs:articleGroupData.breadCrumb} )
    $(".markdown").prepend $node

    for crumb in articleGroupData.breadCrumb
      console.log crumb

  # Dynamically build the page `header` navication
  buildPageNav : () ->
    ar = []
    $headers = $("h1, h2, h3, h4, h5, h6", $(".markdown") )

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
      e.preventDefault();
      $('body').velocity 'scroll', {duration:600, offset:$($.attr(this, 'href')).offset().top, easing:'easeInOutQuint' }


window.nanobox ||= {}
nanobox.Article = Article
