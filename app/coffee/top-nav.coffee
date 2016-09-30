class TopNav

  constructor: (@$topNav) ->
    $('.hamburg-icon', @$topNav).on 'click', ()=>
      @toggleMenu()

  toggleMenu : () ->
    if @isOpen
      @close()
    else
      @open()
    @isOpen = !@isOpen

  open  : () -> @$topNav.addClass 'open'
  close : () -> @$topNav.removeClass 'open'


nanobox = if nanobox? then nanobox else {}
nanobox.TopNav = TopNav
