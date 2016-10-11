class IndexPage

  constructor: () ->
    @$slidePath  = $ '.slide-path'
    @$languages  = $ '.languages'
    @$frameworks = $ '.frameworks'
    @$title      = $ '.title .txt'
    $("a.hex").on 'click', (e)=> @loadFrameworks $(e.currentTarget).attr 'data-language'

  loadFrameworks : (language) ->
    # console.log language
    nanobox.getYaml "/yaml/frameworks/#{language}.yml", language, (yaml)=>
      @$frameworks.empty()
      yaml.language = language
      $node = $ jadeTemplate['index-frameworks']( yaml )
      @$frameworks.append $node
      castShadows()
      $(".direction-link", @$frameworks).on 'click', (e)=>
        @slide 'languages'

      if window.isLocal
        window.localizeLinks()

      setTimeout ()=>
        @slide 'frameworks'
      ,
        20

  slide : (targ) ->
    if targ == 'frameworks'
      left = -592
      txt  = "Guides : Choose a framework"
      $first = @$languages
      $next  = @$frameworks
    else
      left = 0
      txt  = "Guides : Choose a language"
      $first = @$frameworks
      $next  = @$languages

    $first.toggleClass 'hidden'
    @$slidePath.velocity {left:left}, {duration:400, delay:200, easing:"easeInOutQuint", complete:()=>
      $next.toggleClass 'hidden'
    }
    @$title.text txt


new IndexPage()
