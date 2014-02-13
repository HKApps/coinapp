class UserSessionsController < ApplicationController
  respond_to :json

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      respond_with current_user
    else
      respond_with @user_session.errors
    end
  end

  def destroy
    @user_session = UserSession.where(id: params[:id]).first
    @user_session.destroy
    respond_with @user_session
  end

  def user_session_params
    params.require(:user_session).permit(:phone_number, :password)
  end
end
