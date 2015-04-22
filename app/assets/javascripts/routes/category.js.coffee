Stocks.CategoryRoute = Ember.Route.extend
  model: (params) -> @store.find 'category', params.id