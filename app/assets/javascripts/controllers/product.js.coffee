Stocks.ProductController = Ember.Controller.extend
  actions:
    save: () ->
      model = @get('model')
      model.save()
      @transitionToRoute 'category', model.get('category')