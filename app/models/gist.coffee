App.Gist = DS.Model.extend
  htmlUrl: DS.attr 'string'
  public: DS.attr 'boolean'
  createdAt: DS.attr 'string'
  updatedAt: DS.attr 'string'
  description: DS.attr 'string'
  comments: DS.attr 'number'
