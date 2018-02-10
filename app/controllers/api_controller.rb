class ApiController < ApplicationController
  before_filter :verify_api_session

  protected

  def api_user
    @api_user ||= api_session && api_session.record
  end

  def api_session
    @api_session ||= UserSession.find
  end

  def verify_api_session
    return render_error unless api_session
  end

  def render_error(message: "Unauthorized", status: 401)
    render json: { error: message }, status: status
  end
end
