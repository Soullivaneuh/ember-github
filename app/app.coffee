window.App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true

App.ApplicationAdapter = DS.RESTAdapter.extend
  host: 'https://api.github.com'
  headers:
    Authorization: 'token ca428d2041cf284df5a75184d14ed7fd99400b03'

App.ApplicationSerializer = DS.RESTSerializer.extend
  keyForAttribute: (attr) ->
    Ember.String.underscore(attr)
  extractArray: (store, primaryType, payload) ->
    # Payload reload with { type.pluralize: hash }
    payloadKey = Ember.Inflector.inflector.pluralize primaryType.typeKey
    payloadReloaded = []
    payloadReloaded[payloadKey] = payload

    @_super store, primaryType, payloadReloaded
