# For more information see: http://emberjs.com/guides/routing/

PriceTracker.ProductsRoute = Ember.Route.extend({
  model: (params) ->
    return this.store.find('product')
})
