Stocks.ProductController = Ember.Controller.extend
  init: ->
    @_createAttribute = (title, type) ->
      bootbox.prompt
        title: title
        callback: (result) =>
          if result
            record = @store.createRecord type, name: result
            record.save()
  actions:
    save: ->
      model = @get('model')
      model.save()
      @transitionToRoute 'category', model.get('category')
    createProductType: -> @_createAttribute('New product type', 'product_type')
    createProductPacking: -> @_createAttribute('New product packing', 'product_packing')