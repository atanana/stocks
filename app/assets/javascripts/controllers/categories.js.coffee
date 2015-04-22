Stocks.CategoriesController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    delete_category: (category) ->
      bootbox.confirm 'Are you sure?', (result) ->
        if (result)
          category.deleteRecord()
    edit_category: (category) ->
      bootbox.prompt
        title: 'Change name'
        value: category.get 'name'
        callback: (result) ->
          if result
            category.set 'name', result
            category.save()