Stocks.ProductRoute = Ember.Route.extend
  model: (params) -> @store.fetchById 'product', params.id
  setupController: (controller, model) ->
    @_super controller, model
    controller.set 'productTypes', @store.find 'product_type'
    controller.set 'productPackings', @store.find 'product_packing'