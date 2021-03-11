module Overrides

  class SessionsController < DeviseTokenAuth::SessionsController

    protected

    def render_create_success
      render json: resource_data(resource_json: @resource.token_validation_response)
    end

    def render_destroy_success
      head :ok
    end

  end

end
