Stocks.ProductPacking = DS.Model.extend
  name: DS.attr('string')
  products: DS.hasMany('product',
    async: true
  )