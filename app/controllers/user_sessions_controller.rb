class UserSessionsController < ApplicationController
  respond_to :json

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      respond_with current_user
    else
      respond_with @user_session, status: :unprocessable_entity
    end
  end

  def destroy
    current_user_session.destroy
    render json: current_user
  end

  def user_session_params
    params.require(:user_session).permit(:phone_number, :password)
  end
end
