module Overrides

  class UnlocksController < DeviseTokenAuth::UnlocksController

    private

    def after_unlock_path_for(resource)
      "#{Rails.application.credentials[:fe_host_url]}/authentication/unlocked"
    end

  end

end
