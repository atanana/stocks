# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map () ->
  @resource 'categories', path: '/categories', ->
    @resource 'category', path: '/:id'
  @resource 'products', path: '/products'
  @resource 'product_types', path: '/product_types'
  @resource 'product_packings', path: '/product_packings'

Stocks.Router.reopen
  location: 'hash',
  rootURL: '/'