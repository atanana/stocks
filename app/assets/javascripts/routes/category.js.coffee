Stocks.CategoryRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'category', params.id
  setupController: (controller, model) ->
    full_model = @store.fetchById 'category', model.id
    @_super controller, full_model