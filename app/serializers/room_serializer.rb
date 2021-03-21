class RoomSerializer < ActiveModel::Serializer

  attributes :id, :area_id, :title, :description, :description_nighttime

  attributes :nr_id, :er_id, :sr_id, :wr_id, :ur_id, :dr_id

  attributes :nd_id, :ed_id, :sd_id, :wd_id, :ud_id, :dd_id

  attributes :arena, :always_lit, :enclosed, :roughness_multiplier

end
