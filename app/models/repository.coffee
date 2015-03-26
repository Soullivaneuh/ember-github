App.Repository = DS.Model.extend
  name: DS.attr 'string'
  fullName: DS.attr 'string'
  private: DS.attr 'boolean'
  fork: DS.attr 'boolean'
  htmlUrl: DS.attr 'string'
  description: DS.attr 'string'
