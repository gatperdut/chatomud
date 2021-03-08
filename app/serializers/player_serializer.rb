class PlayerSerializer < ActiveModel::Serializer

  attributes :id, :nickname, :image, :email, :role, :created_at

  attribute :current_character_id
  def current_character_id
    object&.current_character&.id
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
