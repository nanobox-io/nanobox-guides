class ArticleMeta

  constructor: () ->
    @findMeta()
    Prism.highlightAll()

  findMeta : () =>
    $('.meta').each (i, item)=>
      $item  = $(item)
      method = $item.attr 'data-method'
      params = $item.attr 'data-params'
      if !params? then params = ""
      params = params.split(",")
      params.unshift $item.next()
      params.unshift $item
      @createHandler method, params

  createHandler : (method, params) ->
    switch method
      when 'snippet'    then actor = new Snippet()
      when 'configFile' then actor = new ConfigMachine()

    actor.run.apply actor, params


new ArticleMeta()
