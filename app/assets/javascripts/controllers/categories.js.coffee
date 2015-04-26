Stocks.CategoriesController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    deleteCategory: (category) ->
      bootbox.confirm 'Are you sure?', (result) ->
        if (result)
          category.destroyRecord()
    editCategory: (category) ->
      bootbox.prompt
        title: 'Change name'
        value: category.get 'name'
        callback: (result) ->
          if result
            category.set 'name', result
            category.save()
    newCategory: ->
      bootbox.prompt
        title: 'New category'
        callback: (result) =>
          if result
            category = @store.createRecord 'category', name: result
            category.save()