coinappServices = angular.module('coinappServices', [])

coinappServices.factory 'Session', ['$http', ($http) ->
  Session = (data) ->
    angular.extend(this, data)

  Session.destroy = ->
    $http.post "/logout.json"
    Session.deleteCookie("api_key")

  Session.prototype.create = ->
    $http.post("/login.json", user_session: this).then (res) =>
      return unless res.status == 201
      Session.setCookie("api_key", res.data.single_access_token, 1)
      res

  Session.setCookie = (c_name, value, exdays) ->
    exdate = new Date()
    exdate.setDate exdate.getDate() + exdays
    c_value = escape(value) + ((if (not (exdays?)) then "" else "; expires=" + exdate.toUTCString()))
    document.cookie = c_name + "=" + c_value

  Session.getCookie = (c_name) ->
    c_value = document.cookie
    c_start = c_value.indexOf(" " + c_name + "=")
    c_start = c_value.indexOf(c_name + "=") if c_start is -1
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

  Session.apiKey = Session.getCookie("api_key")

  Session
]

coinappServices.factory 'User', ['$http', 'Session', ($http, Session) ->
  User = (data) ->
    angular.extend(this, data)

  User.prototype.create = ->
    $http.post "/api/v1/users.json",
      user: this

  User.current = ->
    $http.get "/api/v1/current_user.json?api_key=#{Session.apiKey}"

  User
]

coinappServices.factory 'Schedule', ['$http', 'Session', ($http, Session) ->
  Schedule = (data) ->
    angular.extend(this, data)

  Schedule.getIndex = ->
    $http.get "/api/v1/schedules.json?api_key=#{Session.apiKey}"

  Schedule.prototype.create = ->
    $http.post "/api/v1/schedules.json?api_key=#{Session.apiKey}",
      schedule: this

  Schedule.destroy = (id) ->
    $http.delete "/api/v1/schedules/#{id}.json?api_key=#{Session.apiKey}"

  Schedule.disable = (id) ->
    $http.put "/api/v1/schedules/#{id}/disable.json?api_key=#{Session.apiKey}"

  Schedule.enable = (id) ->
    $http.put "/api/v1/schedules/#{id}/enable.json?api_key=#{Session.apiKey}"

  Schedule
]
