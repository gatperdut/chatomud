class ApplicationController < ActionController::API

  include Pundit

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  def rt_not(action, subaction, payload)
    Realtime.send(action, APP_CONFIG["redis_channel"], { subaction: subaction }.merge(payload))
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
