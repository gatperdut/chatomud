module Overrides

  class TokenValidationsController < DeviseTokenAuth::TokenValidationsController

    protected

    def render_validate_token_success
      render json: resource_data(resource_json: @resource.token_validation_response)
    end

  end

end
