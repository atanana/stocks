Stocks.ProductTypesRoute = Ember.Route.extend
  model: -> @store.find 'product_type'