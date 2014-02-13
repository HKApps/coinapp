coinappServices = angular.module('coinappServices', [])

coinappServices.factory 'Login', ['$http', ($http) ->
  Login = (data) ->
    angular.extend(this, data)

  Login.signIn = (phoneNumber, password) ->

  Login.signUp = (phoneNumber, password) ->

  Login
]

coinappServices.factory 'User', ['$http', ($http) ->
  User = (data) ->
    angular.extend(this, data)

  User.prototype.create = ->
    $http.post "/users.json",
      user: this

  User
]
