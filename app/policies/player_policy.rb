class RolePolicy < ApplicationPolicy

  def index?
    current_user.role == :owner || current_user.role == :admin
  end

end
