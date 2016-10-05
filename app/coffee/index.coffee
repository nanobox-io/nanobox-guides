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
    $("a.hex").on 'click', (e)=>
      @hideLanguages $(e.currentTarget).attr('data-language')

  hideLanguages : (language) ->
    @language = language
    delay     = 0
    duration  = 100
    incrament = 35
    $hexes    = $("a.hex")
    $hexes.length + 500

    count = 0
    $hexes.each ()->
      $hex = $(this)
      xtraDelay = 0 #if $hex.attr('data-language') == language then duration * ($hexes.length - count+9) else 0
      delay += incrament
      $hex.velocity {opacity:0}, {duration:duration, delay:delay + xtraDelay}
      count++

    $(".languages").velocity {opacity:0}, {duration:duration*2, delay:delay, complete:()=>
      $(".languages").addClass('hidden')
      @showLanguageDetails()
    }

    # setTimeout @showLanguageDetails, delay + duration

  showLanguageDetails : () =>
    @lang.language = @language
    @$languageDetails = $ jadeTemplate['index-lang-detail']( @lang )
    $('.index').append @$languageDetails
    @$languageDetails.css opacity:0
    $frameworks = $(".frameworks", @$languageDetails)
    $frameworks.css opacity: 0

    @$languageDetails.velocity {opacity:1}, {duration:300}
    $frameworks.velocity {opacity:1}, {duration:400, delay:250}

    # Only applicable to local testing
    if window.isLocal
      window.localizeLinks()

    castShadows()
    $('.direction-link', @$languageDetails).on 'click', (e)=>
      @hideLanguageDetails()

  hideLanguageDetails : () =>
    @$languageDetails.velocity {opacity:0}, {duration:200, complete:()=>
      $languages = $(".languages")
      $("a.hex", $languages).css opacity: 1
      $languages.removeClass('hidden')
      $languages.velocity {opacity:1}, {duration:300}
      @$languageDetails.remove()
    }


new IndexPage()
