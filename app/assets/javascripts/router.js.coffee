# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map ()->
  @resource 'categories', path: '/'
  @resource 'category', path: '/category/:id'

Stocks.Router.reopen
  location: 'auto',
  rootURL: '/'