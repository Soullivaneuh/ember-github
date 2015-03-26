window.App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true

App.ApplicationAdapter = DS.RESTAdapter.extend
  host: 'https://api.github.com'
  headers:
    Authorization: 'token YOUR_API_TOKEN'

App.ApplicationSerializer = DS.RESTSerializer.extend
  keyForAttribute: (attr) ->
    Ember.String.underscore(attr)
  extractArray: (store, primaryType, payload) ->
    # Payload reload with { type.pluralize: hash }
    payloadKey = Ember.Inflector.inflector.pluralize primaryType.typeKey
    payloadReloaded = []
    payloadReloaded[payloadKey] = payload

    @_super store, primaryType, payloadReloaded
