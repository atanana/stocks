Stocks.CategoriesController = Ember.ArrayController.extend
  sortProperties: ['name'],
  actions:
    detete_category: (category) ->
      console.log(category)
    edit_category: (category) ->
      console.log(category)