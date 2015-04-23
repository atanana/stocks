Stocks.Product = DS.Model.extend
  open: DS.attr('boolean'),
  category: DS.belongsTo('category',
    async: true
  )