module ApplicationCable


  class Channel < ActionCable::Channel::Base

    def current_player
      Player.find_by_action_cable_uid(params[:action_cable_uid])
    end

    def player_is_admin_or_owner
      [:owner, :admin].include?(current_player.&role.to_sym)
    end

  end

end
