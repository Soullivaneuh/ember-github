App.RepositoriesRoute = Ember.Route.extend
#  init: ->
#    @_super()
#    @refresh()

  model: ->
    @store.find 'repository'

  refresh: ->
    setTimeout =>
      @store.find('repository').then (repositories) =>
        @controller.set 'content', repositories
      @refresh()
    , 5000

App.RepositoryRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'repository', params.id
