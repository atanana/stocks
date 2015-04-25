Stocks.Product = DS.Model.extend
  open: DS.attr('boolean', defaultValue: false),
  category: DS.belongsTo('category',
    async: true
  ),
  product_type: DS.belongsTo('product_type',
    async: true
  ),
  product_packing: DS.belongsTo('product_packing',
    async: true
  )