class ApplicationPolicy

  attr_reader :player, :record

  def initialize(player, record)
    @player = player
    @record = record
  end

  def player_is_admin_or_owner
    [:owner, :admin].include?(player.role.to_sym)
  end

end
