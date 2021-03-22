class MapChannel < ApplicationCable::Channel

  def subscribed
    stream_from "map_channel"

    reject unless player_is_admin_or_owner

    Rails.logger.info("Map Channel: #{current_player.nickname} subscribed.")
  end

  def unsubscribed
    Rails.logger.info("Map Channel: #{current_player.nickname} unsubscribed.")
  end

end
