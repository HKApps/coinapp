@coinapp.controller 'SessionsCtrl', ['$scope', 'Session', 'User'
  ($scope, Session, User) ->
    $scope.currentUser = undefined

    $scope.login = (phoneNumber, password) ->
      session = new Session()
      session.phone_number = phoneNumber
      session.password = password
      session.create().then (res) =>
        return unless res.status == 201
        $scope.currentUser = res.data

    $scope.logout = ->
      Session.destroy().then (res) =>
        debugger

      $scope.currentUser = undefined

    $scope.register = (phoneNumber, password) ->
      user = new User()
      user.phone_number = phoneNumber
      user.password = password
      # TODO add confirmation?
      user.password_confirmation = password
      user.create().then (res) =>
        return unless res.status == 201
        $scope.currentUser = res.data

    $scope.validPhoneNumber = (phoneNumber) ->
      # TODO better regex
      phone_regexp = /^[(]{0,1}[0-9]{3}[)\.\- ]{0,1}[0-9]{3}[\.\- ]{0,1}[0-9]{4}$/
      if phone_regexp.test(phoneNumber) then true else false

    $scope.validPassword = (password) ->
      if password.length > 7 then true else false
]
