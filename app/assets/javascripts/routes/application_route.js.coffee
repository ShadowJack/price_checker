# For more information see: http://emberjs.com/guides/routing/

PriceTracker.ApplicationRoute = Ember.Route.extend({
  beforeModel: ->
    this.transitionTo('products');
})
