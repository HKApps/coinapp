class UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.where(id: params[:id]).first

    respond_with @user.as_json
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
