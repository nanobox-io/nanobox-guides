if !window.nanobox?
  window.nanobox = {}

nanobox.getYaml = (url, passBackData, cb) ->
  $.ajax
    url         : url
    type        : 'GET'
    contentType : "application/json;charset=utf-8"
    error       : (request, error)=> console.log "error fetching data : #{error}"
    success     : (data)-> cb(jsyaml.safeLoad(data), passBackData)
