# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map ()->
  @resource 'categories', path: '/', ->
    @resource 'category', path: '/category/:id'
  @resource 'products', path: '/products', ->
    @resource 'product', path: '/:id'

Stocks.Router.reopen
  location: 'hash',
  rootURL: '/'