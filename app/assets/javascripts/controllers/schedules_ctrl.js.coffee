@coinapp.controller 'SchedulesCtrl', ['$scope', 'Schedule',
  ($scope, Schedule) ->
    $scope.comparisons = ["above", "below"]
    $scope.scheduleTypes = ["notify", "buy", "sell"]

    $scope.createSchedule = (comparison, price, scheduleType) ->
      schedule = new Schedule()
      schedule.user_id = $scope.currentUser.id
      schedule.comparison = if comparison == "above" then ">" else "<"
      schedule.price = price
      schedule.schedule_type = scheduleType
      schedule.create().then (res) =>
        return unless res.status == 201
        $scope.new_schedule.$setPristine()
        $scope.resetForm()
        $scope.currentUser.schedules.push res.data

    $scope.enableSchedule = (schedule) ->
      Schedule.enable(schedule.id)
      schedule.enabled = true

    $scope.disableSchedule = (schedule) ->
      Schedule.disable(schedule.id)
      schedule.enabled = false

    $scope.resetForm = ->
      $scope.comparison = undefined
      $scope.price = undefined

]
