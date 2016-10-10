if !window.nanobox?
  window.nanobox = {}

nanobox.getYaml = (url, passBackData, cb) ->
  $.ajax
    url         : url
    type        : 'GET'
    contentType : "application/json;charset=utf-8"
    error       : (request, error)=> console.log "error fetching data : #{error}"
    success     : (data)-> cb(jsyaml.safeLoad(data), passBackData)

nanobox.addBreadcrumb = ($el)->
  url = window.location.href.match( /[^\/:]\/(.+)/)[1]
  if window.isLocal
    url = url.split('.')[0]

  ar = [ {href:'/', txt:'home', klass:''} ]
  pages = url.split("/")
  len   = pages.length
  for item, i in pages
    klass = if i == len-1 then "current" else ""
    ar.push {href:"/#{pages.slice(0,i+1).join('/')}", txt:item.replace(/-/g, ' '), klass:klass}

  $node = $ jadeTemplate['breadcrumb']( {breadCrumbs:ar} )
  $el.prepend $node


nanobox.addIcons = ($el, icons) ->
  icons = icons.split ','
  ar = []
  for icon, i in icons
    ar.push {icon:icon, href:"/#{icons.slice(0,i+1).join('/')}"}

  $node = $ jadeTemplate['article-icons']( {icons:ar} )
  $el.prepend $node
