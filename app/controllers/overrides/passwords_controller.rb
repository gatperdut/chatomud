module Overrides

  class PasswordsController < DeviseTokenAuth::PasswordsController

    private

    def render_not_found_error
      head :ok
    end

  end

end
