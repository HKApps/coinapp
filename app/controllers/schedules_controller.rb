class SchedulesController < ApplicationController
  respond_to :json

  def index
    @schedules = current_user.schedules
    respond_with @schedules
  end

  def create
    @schedule = Schedule.where(schedule_params).first_or_initialize
    @schedule.enabled = true
    @schedule.deleted_at = nil

    if @schedule.save
      respond_with @schedule, status: 201
    else
      respond_with @schedule.errors, status: 401
    end
  end

  def destroy
    @schedule = Schedule.where(id: params[:id]).first
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
      respond_with @schedule.errors, status: 404
    end
  end

  def enable
    @schedule = Schedule.where(id: params[:id]).first
    @schedule.enabled = true
    if @schedule.save
      respond_with @schedule, status: 201
    else
      respond_with @schedule.errors, status: 404
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :price, :comparison)
  end
end
