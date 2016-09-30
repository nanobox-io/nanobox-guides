class ArticleClusters

  constructor: () ->
    @createData()

  makeCluster : ($el, title, cluster) ->
    data = @articleClusters[cluster]
    for article in data.articles
      if article.title == title
        article.active = true

    $node = $ jadeTemplate['articles-nav']( data )
    $el.append $node

  createData : () ->

    @articleClusters =
      # SAILS
      sails :
        breadCrumb:[
          {title:'nodejs', '/nodejs'}
          {title:'sails',  '/nodejs/sails/getting-started'}
        ]
        title    : "Sails"
        articles : [
          {href: "#", title: "Getting Started"},
          {href: "#", title: "Connecting to a database"},
          {href: "#", title: "Adding components"},
          {href: "#", title: "Preparing for productions"}
        ]

window.articleClusters = new ArticleClusters()
