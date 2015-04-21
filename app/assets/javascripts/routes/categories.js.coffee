Stocks.CategoriesRoute = Ember.Route.extend
  model: -> @store.find 'category'