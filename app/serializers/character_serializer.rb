class CharacterSerializer < ActiveModel::Serializer

  attributes :id, :name, :image, :short_desc, :long_desc, :full_desc, :kwords, :created_at

  attributes :player_id, :room_id

  attributes :npc, :gladiator, :active

end
