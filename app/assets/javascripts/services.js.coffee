coinappServices = angular.module('coinappServices', [])

coinappServices.factory 'Session', ['$http', ($http) ->
  Session = (data) ->
    angular.extend(this, data)

  Session.destroy = ->
    $http.post "/logout.json"
    Session.deleteCookie("user_id")

  Session.prototype.create = ->
    $http.post("/login.json", user_session: this).then (res) =>
      return unless res.status == 201
      Session.setCookie("user_id", res.data.id, 1)
      res

  Session.setCookie = (c_name, value, exdays) ->
    exdate = new Date()
    exdate.setDate exdate.getDate() + exdays
    c_value = escape(value) + ((if (not (exdays?)) then "" else "; expires=" + exdate.toUTCString()))
    document.cookie = c_name + "=" + c_value

  Session.getCookie = (c_name) ->
    c_value = document.cookie
    c_start = c_value.indexOf(" " + c_name + "=")
    c_start = c_value.indexOf(c_name + "=")  if c_start is -1
    if c_start is -1
      c_value = null
    else
      c_start = c_value.indexOf("=", c_start) + 1
      c_end = c_value.indexOf(";", c_start)
      c_end = c_value.length  if c_end is -1
      c_value = unescape(c_value.substring(c_start, c_end))
      c_value

  Session.deleteCookie = (c_name) ->
    Session.setCookie(c_name, "", -100)

  Session
]

coinappServices.factory 'User', ['$http', ($http) ->
  User = (data) ->
    angular.extend(this, data)

  User.prototype.create = ->
    $http.post "/users.json",
      user: this

  User.get = (id) ->
    $http.get "/users/#{id}.json"

  User
]
