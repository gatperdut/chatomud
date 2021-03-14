class AttributeSetSerializer < ActiveModel::Serializer

  attributes :id, :character_id

  attributes :str, :con, :agi, :dex, :int, :wil, :pow

end
