class Api::V1::SchedulesController < ApiController
  before_filter :verify_api_session

  respond_to :json

  def index
    respond_with api_user.schedules
  end

  def create
    schedule = api_user.schedules.create(schedule_params)
    respond_with schedule, location: api_v1_schedules_url(schedule)
  end

  def destroy
    schedule.destroy
    respond_with schedule, location: api_v1_schedule_url(schedule)
  end

  def disable
    schedule.disabled!
    respond_with schedule, location: disable_api_v1_schedule_url(schedule)
  end

  def enable
    schedule.enabled!
    respond_with schedule, location: enable_api_v1_schedule_url(schedule)
  end

  private

  def schedule
    @schedule ||= Schedule.find_by id: params[:id]
  end

  def schedule_params
    params.require(:schedule).permit(:user_id, :price, :comparison)
  end
end
