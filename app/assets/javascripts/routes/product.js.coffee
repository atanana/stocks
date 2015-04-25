setupController = (controller, model) ->
  @_super controller, model
  controller.set 'productTypes', @store.find 'product_type'
  controller.set 'productPackings', @store.find 'product_packing'
  controller.set 'categories', @store.find 'category'

Stocks.ProductRoute = Ember.Route.extend
  model: (params) -> @store.fetchById 'product', params.id
  setupController: setupController

Stocks.ProductsNewRoute = Ember.Route.extend
  model: -> @store.createRecord 'product'
  templateName: 'product'
  controllerName: 'product'
  setupController: setupController