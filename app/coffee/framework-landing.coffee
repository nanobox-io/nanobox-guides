class FrameworkLanding extends Landing

  constructor: (requiredComponents, optionalComponents, informalName, articles) ->
    super()
    @buildLeftSection requiredComponents, optionalComponents, informalName
    @loadArticleGroups articles

  buildLeftSection : (requiredComponents=[], optionalComponents=[], informalName) ->
    data =
      requiredComponents : requiredComponents
      optionalComponents : optionalComponents
      informalName       : informalName
    $node = $ jadeTemplate['framework-overview/left-map']( data )
    $("#left").append $node
    castShadows $node

    # In the svg, highlight any active components
    for component, i in requiredComponents
      $box = $("#framework-map #box#{i+1}")
      $box.attr 'class', "#{$box.attr('class')} active #{component.icon}"

    $(".component").on 'click', (e)=>
      $component = $(e.currentTarget)
      @showServiceCard $component.attr('id'), $('.txt', $component).text()

  showServiceCard : (serviceId, name) ->
    nanobox.getYaml "/yaml/service-snippets/#{serviceId}.yml", null, (yaml)=>
      if @$serviceCard? then @$serviceCard.remove()

      yaml.service = serviceId
      yaml.name    = name
      if !yaml.description? then yaml.description = "Add the following snippet to your boxfile.yml and redeploy to create a #{yaml.service} component"

      @$serviceCard = $ jadeTemplate['framework-overview/service-card']( yaml )
      @$serviceCard.css opacity:0
      @$serviceCard.velocity {opacity:1}, {duration:200}
      $("#left").append @$serviceCard
      castShadows @$serviceCard
      Prism.highlightElement($("pre",@$serviceCard)[0])
      $(".close", @$serviceCard).on 'click', ()=>
        @$serviceCard.velocity {opacity:0}, duration:300, complete:()=>
          @$serviceCard.remove()
      # Only applicable to local testing
      if window.isLocal
        window.localizeLinks()


window.FrameworkLanding = FrameworkLanding
