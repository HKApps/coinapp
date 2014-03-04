class CreateCompletedActionsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :completed_actions, retry: false

  def perform(schedule_id, price)
    CompletedActions.create(schedule_id: schedule_id, price: price.to_f.to_d)
  end
end
