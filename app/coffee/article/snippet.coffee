class Snippet

  serviceDictionary:
    postgres   : {image:'postgresql', icon:'postgres', serviceId:'data.db', category:'database' }
    mongo      : {image:'mongodb',    icon:'mongo',    serviceId:'data.db', category:'database' }
    mysql      : {image:'mysql',      icon:'mysql',    serviceId:'data.db', category:'database', name:'MySQL' }
    redis      : {image:'redis',      icon:'redis',    serviceId:'data.db', category:'database' }
    memcached  : {image:'memcached',  icon:'memcached',serviceId:'data.db', category:'database' }

  constructor : (@$item, @$codeBlock)->

  optionalComponents : () ->
    @$item.addClass 'service-swapper'
    ar = []
    for service in arguments
      item = @serviceDictionary[service]
      item.id = service
      if !item.name? then item.name = item.icon
      ar.push item

    $node = $ jadeTemplate['article/service-swapper']( services:ar )
    @$item.append $node
    $codeHolder = $ '.code-holder', @$item

    $serviceBtn = $('.service', $node)
    $serviceBtn.on 'click', (e)=>
      $serviceBtn.removeClass 'active'
      $(e.currentTarget).addClass 'active'
      data = @serviceDictionary[ e.currentTarget.getAttribute('data-kind') ]
      $node = $ jadeTemplate['article/yaml-service']( data )
      $codeHolder.empty()
      $codeHolder.append $node
      Prism.highlightElement $('code', $node)[0]

    $($serviceBtn[0]).trigger 'click'
    castShadows $node

  replaceComments : () ->


  compress : (start="", end) ->
    if start.length == 0 then return

    @$item.addClass 'expand'
    $code      = $("code", @$codeBlock)
    code       = $code[0].innerHTML
    startIndex = code.indexOf start
    endIndex   = code.lastIndexOf end
    if endIndex == -1
      matchedCode = code.substr startIndex
    else
      matchedCode = code.substr startIndex, endIndex - startIndex
    $node = $ jadeTemplate['article/code']( code:matchedCode, klass:$code.attr('class') )
    $node.insertBefore @$codeBlock
    @$codeBlock.addClass 'hidden'

    @$item.on 'click', ()=>
      @$item.toggleClass 'expanded'
      # @$item.toggleClass 'hidden'
      @$codeBlock.toggleClass 'hidden'
      $node.toggleClass 'hidden'


window.Snippet = Snippet
