Stocks.IndexRoute = Ember.Route.extend
  beforeModel: () ->
    @transitionTo('categories')