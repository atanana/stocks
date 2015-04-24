# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map () ->
  @resource 'categories', path: '/categories'
  @route 'category', path: 'category/:id'
  @resource 'products', path: '/products'
  @route 'product', path: '/product/:id',
  @resource 'product_types', path: '/product_types'
  @resource 'product_packings', path: '/product_packings'

Stocks.Router.reopen
  location: 'auto',
  rootURL: '/'