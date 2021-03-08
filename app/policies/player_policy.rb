class PlayerPolicy < ApplicationPolicy

  def index?
    [:owner, :admin].include?(player.role.to_sym)
  end

  def query?
    index?
  end

end
