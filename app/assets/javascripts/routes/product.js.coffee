Stocks.ProductRoute = Ember.Route.extend
  model: (params) -> @store.fetchById 'product', params.id