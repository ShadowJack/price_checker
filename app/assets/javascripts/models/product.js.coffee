# for more details see: http://emberjs.com/guides/models/defining-models/

PriceTracker.Product = DS.Model.extend({
  url: DS.attr('string'),
  description: DS.attr('string'),
  aimPrice: DS.attr('number')
})