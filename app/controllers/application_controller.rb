class ApplicationController < ActionController::API

  include Pundit

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  def pundit_user
    current_player
  end

  rescue_from Pundit::NotAuthorizedError, with: :player_not_authorized

  def rt_not(action, subaction, payload)
    # ChatoMud::Realtime.send(action, Rails.application.credentials[:redis][:channel], { subaction: subaction }.merge(payload))
  end

  private

  def player_not_authorized
    head :forbidden
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
