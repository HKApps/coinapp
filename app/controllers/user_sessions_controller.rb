class UserSessionsController < ApplicationController
  respond_to :json

  def create
    binding.pry
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      respond_with current_user, location: nil
    else
      respond_with @user_session, status: :unprocessable_entity
    end
  end

  def destroy
    current_user_session.destroy
    head :ok
  end

  def user_session_params
    params.require(:user_session).permit(:phone_number, :password)
  end
end
