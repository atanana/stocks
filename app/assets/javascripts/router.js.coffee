# For more information see: http://emberjs.com/guides/routing/

Stocks.Router.map ()->
  @resource 'categories', path: '/'

Stocks.Router.reopen
  location: 'auto',
  rootURL: '/'