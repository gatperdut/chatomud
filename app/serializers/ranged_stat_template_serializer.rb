class RangedStatTemplateSerializer < ActiveModel::Serializer

  attributes :id, :weapon_stat_template_id, :missile_type, :ranges_suitability, :can_remain_loaded

end
