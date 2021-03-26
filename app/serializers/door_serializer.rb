class DoorSerializer < ActiveModel::Serializer

  attributes :id, :short_desc, :long_desc, :full_desc

  attributes :nr_id, :er_id, :sr_id, :wr_id, :ur_id, :dr_id

  attributes :see_through, :open

end
