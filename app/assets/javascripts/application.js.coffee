#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require bootbox
#= require ember
#= require ember-data
#= require_self
#= require stocks

# for more details see: http://emberjs.com/guides/application/
window.Stocks = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true,
  rootElement: '#ember-app'