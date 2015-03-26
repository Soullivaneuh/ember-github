App.GistsRoute = Ember.Route.extend
  init: ->
    @_super()
    @refresh()

  model: ->
    @store.find 'gist'

  refresh: ->
    setTimeout =>
      @store.find('gist').then (gists) =>
        @controller.set 'content', gists
      @refresh()
    , 5000

App.GistRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'gist', params.id
