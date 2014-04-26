@coinapp.controller 'SchedulesCtrl', ['$scope', 'Schedule',
  ($scope, Schedule) ->
    $scope.comparisons = ["above", "below"]

    $scope.createSchedule = (comparison, price) ->
      schedule = new Schedule()
      schedule.user_id = $scope.currentUser.id
      schedule.comparison = if comparison == "above" then ">" else "<"
      schedule.price = price
      schedule.create($scope.apiKey).then (res) =>
        return unless res.status == 201
        $scope.new_schedule.$setPristine()
        $scope.resetForm()
        $scope.currentUser.schedules.push res.data

    $scope.enableSchedule = (schedule) ->
      Schedule.enable(schedule.id, $scope.apiKey)
      schedule.enabled = true

    $scope.disableSchedule = (schedule) ->
      Schedule.disable(schedule.id, $scope.apiKey)
      schedule.enabled = false

    $scope.resetForm = ->
      $scope.comparison = undefined
      $scope.price = undefined

]
