class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

  def current_user_session
    @current_user_sesion ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end
end
