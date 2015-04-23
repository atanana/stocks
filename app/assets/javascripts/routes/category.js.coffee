Stocks.CategoryRoute = Ember.Route.extend
  model: (params) -> @store.fetchById 'category', params.id