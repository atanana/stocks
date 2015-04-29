Stocks.DefaultEntityController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    delete: (record) ->
      bootbox.confirm 'Are you sure?', (result) ->
        if (result)
          record.destroyRecord()
    edit: (record) ->
      bootbox.prompt
        title: 'Change name'
        value: record.get 'name'
        callback: (result) ->
          if result
            record.set 'name', result
            record.save()
    new: ->
      bootbox.prompt
        title: @get 'title'
        callback: (result) =>
          if result
            record = @store.createRecord @get('recordType'), name: result
            record.save()

Stocks.CategoriesController = Stocks.DefaultEntityController.extend
  title: 'New category'
  recordType: 'category'

Stocks.ProductTypesController = Stocks.DefaultEntityController.extend
  title: 'New product type'
  recordType: 'product_type'

Stocks.ProductPackingsController = Stocks.DefaultEntityController.extend
  title: 'New product packing'
  recordType: 'product_packing'