class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      respond_with @user_session
    else
      #
    end
  end

  def destroy
    @user_session = UserSession.where(id: params[:id]).first
    @user_session.destroy
    respond_with @user_session
  end
end
