class GithubIcons

  constructor: () ->
    @$iconHolder = $ '.github-icons'
    window.makeIcon   = @createIcon
    window.emptyIcon  = @clearHeader
    makeIcon 'rails', "Ruby on Rails"

  clearHeader : (x) =>
    console.log x
    @$iconHolder.empty()

  createIcon : (icon, title) =>
    @clearHeader()
    $node = $ jadeTemplate['github-icons/header']( {icon:icon, title:title} )
    castShadows $node
    @$iconHolder.append $node

new GithubIcons()
