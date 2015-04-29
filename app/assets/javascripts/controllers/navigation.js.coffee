Stocks.NavigationController = Ember.ArrayController.extend
  model: Ember.A [
    Ember.Object.create
      title: 'Categories'
      location: 'categories'
      active: null
    Ember.Object.create
      title: 'Product types'
      location: 'product_types'
      active: null
    Ember.Object.create
      title: 'Product packings'
      location: 'product_packings'
      active: null
  ]