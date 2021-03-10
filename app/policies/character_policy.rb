class CharacterPolicy < ApplicationPolicy

  def show?
    player_is_admin_or_owner || player.character_ids.include(record.id)
  end

end
