class MapChannel < ApplicationCable::Channel

  def subscribed
    stream_from "map_channel"

    reject unless player_is_admin_or_owner
  end

  def unsubscribed

  end

end
