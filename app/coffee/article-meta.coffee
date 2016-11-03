class ArticleMeta

  constructor: () ->
    # @findMeta()
    Prism.highlightAll()

  findMeta : () =>
    $('.meta').each (i, item)=>
      $item = $(item)
      method = $item.attr 'data-method'
      params = $item.attr 'data-params'
      if !params? then params = ""
      params = params.split(",")
      params.unshift $item.next()
      @[method].apply this, params
      $item.next()

  snippet : ($codeBlock, start="", end) ->
    code       = $("code", $codeBlock[0])[0].innerHTML
    startIndex = code.indexOf start
    endIndex   = code.lastIndexOf end
    if endIndex == -1
      matchedCode = code.substr startIndex
    else
      matchedCode = code.substr startIndex, endIndex - startIndex

    console.log "---------"
    console.log matchedCode
    console.log "+++++++++"
    console.log start
    console.log end
    console.log endIndex
    # Create the matched code as a new block
    # Add `language-none` to the original block
    # Create an element with the (...) expand +


new ArticleMeta()
