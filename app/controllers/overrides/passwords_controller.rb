module Overrides

  class PasswordsController < DeviseTokenAuth::PasswordsController

    private

    def render_create_success
      head :ok
    end

    def render_update_success
      head :ok
    end

    def render_not_found_error
      head :ok
    end

  end

end
