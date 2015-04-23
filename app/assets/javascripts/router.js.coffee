# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map ()->
  @resource 'categories', path: '/', ->
    @resource 'category', path: '/category/:id'
  @resource 'products', path: '/products', ->
    @resource 'product', path: '/:id'
  @resource 'product_types', path: '/product_types', ->
    @resource 'product_type', path: '/:id'
  @resource 'product_packings', path: '/product_packings', ->
    @resource 'product_packing', path: '/:id'

Stocks.Router.reopen
  location: 'hash',
  rootURL: '/'