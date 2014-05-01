@coinapp.controller 'SchedulesCtrl', ['$scope', 'Schedule', 'Session'
  ($scope, Schedule, Session) ->
    $scope.comparisons = ["above", "below"]

    apiKey = Session.getCookie("api_key")

    $scope.createSchedule = (comparison, price) ->
      schedule = new Schedule()
      schedule.user_id = $scope.currentUser.id
      schedule.comparison = if comparison == "above" then ">" else "<"
      schedule.price = price
      schedule.create(apiKey).then (res) =>
        return unless res.status == 201
        $scope.new_schedule.$setPristine()
        $scope.resetForm()
        $scope.currentUser.schedules.push res.data

    $scope.enableSchedule = (schedule) ->
      Schedule.enable(schedule.id, apiKey)
      schedule.enabled = true

    $scope.disableSchedule = (schedule) ->
      Schedule.disable(schedule.id, apiKey)
      schedule.enabled = false

    $scope.resetForm = ->
      $scope.comparison = undefined
      $scope.price = undefined

]
