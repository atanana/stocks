Stocks.CategoryRoute = Ember.Route.extend
  model: (params) -> @store.find 'category', params.id
  setupController: (controller, model) ->
    @_super controller, model
    controller.set 'sortedProducts', Ember.ArrayController.create(
      model: model.get 'products'
      sortProperties: ['product_type.name']
    )