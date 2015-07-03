# Override the default adapter with the `DS.ActiveModelAdapter` which

PriceTracker.ApplicationAdapter = DS.ActiveModelAdapter.extend({})

DS.RESTAdapter.reopen
  namespace: 'api/v1'
