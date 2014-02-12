@coinapp.controller 'LoginCtrl', ['$scope', 'Login',
  ($scope, Login) ->
    $scope.signIn = (phoneNumber, password) ->
      Login.signIn(phoneNumber, password)

    $scope.signUp = (phoneNumber, password) ->
      Login.signUp(phoneNumber, password)

    $scope.validPhoneNumber = (phoneNumber) ->
      phone_regexp = /^[(]{0,1}[0-9]{3}[)\.\- ]{0,1}[0-9]{3}[\.\- ]{0,1}[0-9]{4}$/
      if phone_regexp.test(phoneNumber) then true else false

    $scope.validPassword = (password) ->
      if password.length > 4 then true else false
]
