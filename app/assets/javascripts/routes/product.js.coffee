Stocks.ProductRoute = Ember.Route.extend
  model: (params) -> @store.fetchById 'product', params.id
  setupController: (controller, model) ->
    @_super controller, model
    controller.set 'productTypes', @store.find 'product_type'
    controller.set 'productPackings', @store.find 'product_packing'
    controller.set 'categories', @store.find 'category'

Stocks.ProductsNewRoute = Stocks.ProductRoute.extend
  model: (params) ->
    @store.find('category', params.category_id).then (category) =>
      @store.createRecord 'product', category: category
  templateName: 'product'
  controllerName: 'product'
  setupController: (controller, model) ->
    @_super controller, model
    controller.get('productTypes').then (items) ->
      model.set 'product_type', items.objectAt(0)
    controller.get('productPackings').then (items) ->
      model.set 'product_packing', items.objectAt(0)