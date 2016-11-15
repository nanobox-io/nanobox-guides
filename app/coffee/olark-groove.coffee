class Chatter

  constructor: (@$el) ->
    @$el.on 'click', @onClick

  onClick : (e)=>
    if @$el.hasClass('olark')
      olark 'api.box.expand'
      olark 'api.box.show'
    if @$el.hasClass('groove')
      groove.widget 'open'

  hide : () ->
    @$el.hide()


class Support

  constructor : ()->
    window.addChatter = @addChatter
    @chatters = []
    @workInProgress = @addChatter $('.work-in-progress').find('.chat')
    @mainSupport    = @addChatter $('.support')

    # Initialize olark
    olark 'api.box.hide'
    # Olark events
    olark 'api.chat.onOperatorsAvailable', => @setStatus 'olark'
    olark 'api.chat.onOperatorsAway',      => @setStatus 'groove'
    # Showing / hiding chat window
    olark 'api.box.onExpand',              => @mainSupport.hide()
    olark 'api.box.onShrink', =>
      @mainSupport.show()
      olark 'api.box.hide'

  setStatus : (newStatus) ->
    @status = newStatus
    oldStatus = if newStatus == 'olark' then 'groove' else 'olark'
    for chatter in @chatters
      chatter.$el.removeClass oldStatus
      chatter.$el.addClass newStatus

  addChatter : ($el) =>
    if @status?
      $el.addClass @status
    chatter = new Chatter($el)
    @chatters.push chatter
    chatter

$(document).ready ()=>
  new Support()
