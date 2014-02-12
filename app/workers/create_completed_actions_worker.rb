class CreateCompletedActionsWorker
  include Sidekiq::Worker

  def perform(schedule_id, price)
    CompletedActions.create(schedule_id: schedule_id, price: price)
  end
end
