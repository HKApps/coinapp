class Api::V1::SchedulesController < ApiController
  respond_to :json

  def index
    @schedules = current_user.schedules
    respond_with @schedules
  end

  def create
    @schedule = Schedule.create(schedule_params)
    respond_with @schedule
  end

  def destroy
    @schedule = Schedule.find_by id: params[:id]
    if @schedule.destroy
      respond_with status: 201
    else
      respond_with status: 404
    end
  end

  def disable
    @schedule = Schedule.where(id: params[:id]).first
    @schedule.enabled = false
    if @schedule.save
      respond_with @schedule, status: 201
    else
      respond_with @schedule, status: 404
    end
  end

  def enable
    @schedule = Schedule.find_by id: params[:id]
    @schedule.enabled = true
    if @schedule.save
      respond_with @schedule, status: 201
    else
      respond_with @schedule, status: 404
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :price, :comparison)
  end
end
