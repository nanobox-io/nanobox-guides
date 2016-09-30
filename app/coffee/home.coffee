class Home

  constructor: (@$el) ->
    @$topNav = $ '.top-nav', @$el
    setTimeout @addScrollListener, 500
    @addNavScrolling()

  addScrollListener : () =>
    $window  = $ window

    positions = [
      {pos: $("#local",  @$el).offset().top, target: $("#local-link",  @$el), id:"#local"}  # 844
      {pos: $("#deploy", @$el).offset().top, target: $("#deploy-link", @$el), id:"#deploy"} # 2341
      {pos: $("#live",   @$el).offset().top, target: $("#live-link",   @$el), id:"#live"}   # 2981
    ]
    console.log positions

    $window.on 'scroll', ()=>
      top = $window.scrollTop()
      for i in [positions.length-1..0]
        if top > positions[i].pos
          @toggleJumpLinkActive positions[i].id
          break

      if top > 1000
        @fixNav()
      else
        @unFixNav()

  addNavScrolling : () ->
    $('.jumper', @$topNav).on 'click', (e)=>
      @scrollTo $(e.currentTarget).attr('data-target')
      # @toggleJumpLinkActive id
      # @scrollTo id

  toggleJumpLinkActive : (id) ->
    $('.jumper', @$topNav).removeClass 'active'
    $(".jumper#{id}-link", @$topNav).addClass 'active'

  scrollTo : (target) ->
    $('body').velocity 'scroll', {duration:1200, offset:$(target, @$el).offset().top-100, easing:'easeInOutQuint' }

  fixNav : () ->
    return if @fixed
    @fixed = true
    @$topNav.addClass 'fixed'
    @$topNav.css opacity:0
    setTimeout ()=>
      @$topNav.velocity {opacity:1}, {duration:200}
    ,
      20

  unFixNav : () ->
    return if !@fixed
    @fixed = false
    @$topNav.removeClass 'fixed'


# home = new Home $('.main-wrapper')
