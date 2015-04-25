Stocks.ProductController = Ember.Controller.extend
  actions:
    save: () -> @get('model').save()