class Api::V1::UsersController < ApiController
  respond_to :json

  before_filter :verify_api_session, only: [:current_user]

  def current_user
    respond_with api_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_with @user, location: nil
    else
      respond_with @user, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone_number, :password, :password_confirmation)
  end
end
