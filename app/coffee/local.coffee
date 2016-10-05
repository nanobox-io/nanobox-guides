# Local Files are accessed with the .html extension. In the final build, we use urls without the html
# Therefore locally, we append .html to any local links
window.isLocal = true
window.localizeLinks = ()->
  links = $('a')
  for $link in links
    href = $link.getAttribute 'href'

    # If this is a local link such as /ruby/rails
    if href?.match /^\/[^.]+$/g
      # If there is a trailing slash, chop it off..
      if href.substr(href.length - 1) == '/'
        href = href.substr 0, href.length-1

      $link.setAttribute 'href', "#{href}.html"
  console.log links.length

window.localizeLinks()
