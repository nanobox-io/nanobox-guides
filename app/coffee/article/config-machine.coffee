class ConfigMachine

  constructor : (@$item, @$codeBlock) ->

  run : (path)->
    @$item.remove()
    @$codeBlock.addClass 'hidden'
    $node = $ jadeTemplate['article/snippet']( {path:path} )
    $node.insertBefore @$codeBlock
    codeIsOpen = false
    $copyCodeBtn = $(".copy", $node)

    $(".view", $node).on 'click', ()=>
      @$codeBlock.toggleClass 'hidden'
      codeIsOpen = !codeIsOpen
    clipboard = new Clipboard $copyCodeBtn[0],
      target:()=>
        @$codeBlock.removeClass 'hidden'
        return @$codeBlock[0]

    clipboard.on 'success', (e)=>
      e.clearSelection()
      $copyCodeBtn.addClass 'copy-success'
      if !codeIsOpen
        @$codeBlock.addClass 'hidden'

window.ConfigMachine = ConfigMachine
