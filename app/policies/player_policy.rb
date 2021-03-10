class PlayerPolicy < ApplicationPolicy

  def index?
    player_is_admin_or_owner
  end

end
