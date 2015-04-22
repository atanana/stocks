Stocks.CategoriesController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    detete_category: (category) ->
      console.log(category)
    edit_category: (category) ->
      bootbox.prompt
        title: 'Изменить название категории'
        value: category.get 'name'
        callback: (result) ->
          if result
            category.set 'name', result
            category.save()