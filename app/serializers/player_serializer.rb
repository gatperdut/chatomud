class PlayerSerializer < ActiveModel::Serializer

  attributes :id, :nickname, :image, :email, :action_cable_uid, :role, :created_at

  attribute :current_character
  def current_character
    object.current_character
  end

  attribute :access_locked
  def access_locked
    object.access_locked?
  end

  attribute :confirmed
  def confirmed
    object.confirmed?
  end

end
