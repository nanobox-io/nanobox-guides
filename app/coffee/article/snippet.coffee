class Snippet

  run : ($item, $codeBlock, start="", end) ->
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

      
window.Snippet = Snippet
