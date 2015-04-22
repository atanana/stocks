Stocks.CategoriesController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    delete_category: (category) ->
      bootbox.confirm 'Are you sure?', (result) ->
        if (result)
          category.destroyRecord()
    edit_category: (category) ->
      bootbox.prompt
        title: 'Change name'
        value: category.get 'name'
        callback: (result) ->
          if result
            category.set 'name', result
            category.save()
    new_category: ->
      bootbox.prompt
        title: 'New category'
        callback: (result) =>
          if result
            category = @store.createRecord 'category', name: result
            category.save()