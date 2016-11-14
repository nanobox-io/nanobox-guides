class ArticleMeta

  constructor: () ->
    @findMeta()
    Prism.highlightAll()

  findMeta : () =>
    $('.meta').each (i, item)=>
      $item  = $(item)
      klass  = $item.attr 'data-class'
      params = $item.attr 'data-params'
      data   = $item.data()

      if !params? then params = ""
      @createHandler data, $item, $item.next()

  createHandler : (data, $item, $target) ->
    switch data.class
      when 'snippet'    then actor = new Snippet $item, $target
      when 'configFile' then actor = new ConfigMachine $item, $target

    delete data.class
    for method, params of data
      actor[method].apply actor, params.split(',')


new ArticleMeta()
