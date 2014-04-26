class Api::V1::SchedulesController < ApiController
  before_filter :verify_api_session

  respond_to :json

  def index
    @schedules = api_user.schedules
    respond_with @schedules
  end

  def create
    @schedule = api_user.schedules.create(schedule_params)
    respond_with @schedule, location: api_v1_schedules_url(@schedule)
  end

  def destroy
    @schedule = Schedule.find_by id: params[:id]
    if @schedule.destroy
      respond_with status: 201, location: api_v1_schedule_url(@schedule)
    else
      respond_with status: 404, location: api_v1_schedule_url(@schedule)
    end
  end

  def disable
    @schedule = Schedule.where(id: params[:id]).first
    @schedule.enabled = false
    if @schedule.save
      respond_with @schedule, status: 201, location: disable_api_v1_schedule_url(@schedule)
    else
      respond_with @schedule, status: 404, location: disable_api_v1_schedule_url(@schedule)
    end
  end

  def enable
    @schedule = Schedule.find_by id: params[:id]
    @schedule.enabled = true
    if @schedule.save
      respond_with @schedule, status: 201, location: enable_api_v1_schedule_url(@schedule)
    else
      respond_with @schedule, status: 404, location: enable_api_v1_schedule_url(@schedule)
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :price, :comparison)
  end
end
