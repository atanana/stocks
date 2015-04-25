Stocks.CategoryController = Ember.Controller.extend
  actions:
    openProduct: (product) ->
      product.set 'open', true
      product.save()
    closeProduct: (product) ->
      product.set 'open', false
      product.save()
    addProduct: ->
      newProduct = @store.createRecord 'product', category: @get('model')
      @transitionToRoute 'product', newProduct