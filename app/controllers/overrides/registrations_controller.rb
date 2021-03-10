module Overrides

  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    protected

    def build_resource
      super
      @resource.nickname = sign_up_params[:nickname]
    end

  end

end
