class IndexPage

  lang :
    language:"ruby"
    frameworks:[
      {id:'rails', href:"/ruby/rails/overview"}
      {id:'sinatra', href:"/ruby/sinatra/overview"}
    ]
    guides:[
      {title:"Launching a Basic Ruby App"}
    ]

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
    else
      left = 0
      txt  = "Guides : Choose a language"

    @$languages.toggleClass 'hidden'
    @$frameworks.toggleClass 'hidden'
    @$slidePath.velocity {left:left}, {duration:600, easing:"easeInOutQuint", delay:100}
    @$title.text txt


new IndexPage()
