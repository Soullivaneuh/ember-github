App.Router.map ->
  @route 'index',
    path: '/'
  @resource 'repositories', ->
    @resource 'repository',
      path: ':id'
  @resource 'gists', ->
    @resource 'gist',
      path: ':id'
