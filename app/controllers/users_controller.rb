class UsersController < ApplicationController
  respond_to :json

  def create
    @user = User.new(user_params)
    if @user.save
      respond_with @user
    else
      respond_with @user.errors, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:phone_number, :password, :password_confirmation)
  end
end
