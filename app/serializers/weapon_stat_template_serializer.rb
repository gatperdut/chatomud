class WeaponStatTemplateSerializer < ActiveModel::Serializer

  attributes :id, :item_template_id, :grip, :roll_mod, :critical_mod, :base

  has_one :melee_stat_template

  has_one :ranged_stat_template

end
