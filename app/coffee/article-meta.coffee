class ArticleMeta

  constructor: () ->
    @findMeta()
    Prism.highlightAll()

  findMeta : () =>
    $('.meta').each (i, item)=>
      $item = $(item)
      method = $item.attr 'data-method'
      params = $item.attr 'data-params'
      if !params? then params = ""
      params = params.split(",")
      params.unshift $item.next()
      params.unshift $item
      @[method].apply this, params

  configFile : ($item, $codeBlock, path) ->
    $item.remove()
    $codeBlock.addClass 'hidden'
    $node = $ jadeTemplate['article/snippet']( {path:path} )
    $node.insertBefore $codeBlock
    codeIsOpen = false
    $copyCodeBtn = $(".copy", $node)

    $(".view", $node).on 'click', ()->
      $codeBlock.toggleClass 'hidden'
      codeIsOpen = !codeIsOpen
    clipboard = new Clipboard $copyCodeBtn[0],
      target:()->
        $codeBlock.removeClass 'hidden'
        return $codeBlock[0]

    clipboard.on 'success', (e)->
      e.clearSelection()
      $copyCodeBtn.addClass 'copy-success'
      if !codeIsOpen
        $codeBlock.addClass 'hidden'

  snippet : ($item, $codeBlock, start="", end) ->
    if start.length == 0 then return

    $item.addClass 'expand'
    $code      = $("code", $codeBlock)
    code       = $code[0].innerHTML
    startIndex = code.indexOf start
    endIndex   = code.lastIndexOf end
    if endIndex == -1
      matchedCode = code.substr startIndex
    else
      matchedCode = code.substr startIndex, endIndex - startIndex
    $node = $ jadeTemplate['article/code']( code:matchedCode, klass:$code.attr('class') )
    $node.insertBefore $codeBlock
    $codeBlock.addClass 'hidden'

    $item.on 'click', ()->
      $item.toggleClass 'expanded'
      # $item.toggleClass 'hidden'
      $codeBlock.toggleClass 'hidden'
      $node.toggleClass 'hidden'

new ArticleMeta()
