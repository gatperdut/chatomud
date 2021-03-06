module Overrides

  class ConfirmationsController < DeviseTokenAuth::ConfirmationsController

    def show
      super
    rescue ActionController::RoutingError => e
      redirect_to "#{Rails.application.credentials[:fe_host_url]}/authentication/confirmation"
    end

  end

end
