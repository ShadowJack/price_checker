# For more information see: http://emberjs.com/guides/routing/

PriceTracker.Router.reopen
  rootURL: '/'
  location: 'auto'

PriceTracker.Router.map ()->
  @resource 'products', ->
    @resource 'prices', { path: '/:product_id' }

