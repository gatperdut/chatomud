module Overrides

  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    protected

    def build_resource
      @resource            = resource_class.new(sign_up_params)
      @resource.provider   = provider

      # honor devise configuration for case_insensitive_keys
      if resource_class.case_insensitive_keys.include?(:email)
        @resource.email = sign_up_params[:email].try(:downcase)
      else
        @resource.email = sign_up_params[:email]
      end

      @resource.nickname = sign_up_params[:nickname]
    end

  end

end