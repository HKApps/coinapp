#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require angular
#= require angular-route
#= require ui-bootstrap
#= require_self
#= require services
#= require filters
#= require directives
#= require_tree ./controllers/

@coinapp = angular
  .module('coinapp', [
    "ngRoute",
    "coinappServices",
    "coinappFilters",
    "coinappDirectives",
    "ui.bootstrap"
  ])
  .config(['$locationProvider', '$routeProvider', '$httpProvider',
    ($locationProvider, $routeProvider, $httpProvider) ->
      $locationProvider.html5Mode(true)

      $routeProvider
        .when '/',
          templateUrl: '/partials/schedules/index.html'
        .otherwise
          redirectTo: '/'
  ])
