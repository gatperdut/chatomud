class ItemTemplateSerializer < ActiveModel::Serializer

  attributes :id, :code, :short_desc, :long_desc, :full_desc, :kwords

  attributes :weight, :is_sheath, :is_quiver, :possible_slots

  has_one :weapon_stat_template

end
