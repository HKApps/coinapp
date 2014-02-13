coinappServices = angular.module('coinappServices', [])

coinappServices.factory 'Session', ['$http', ($http) ->
  Session = (data) ->
    angular.extend(this, data)

  Session.destroy = ->
    $http.post "/logout.json"

  Session.prototype.create = ->
    $http.post "/login.json",
      user_session: this

  Session
]

coinappServices.factory 'User', ['$http', ($http) ->
  User = (data) ->
    angular.extend(this, data)

  User.prototype.create = ->
    $http.post "/users.json",
      user: this

  User
]
