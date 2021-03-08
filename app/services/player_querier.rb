class PlayerQuerier < ApplicationService

  def initialize(options)
    @nickname = options[:nickname]
  end

  def call
    players = Player.all
    players = players.where("nickname LIKE ?", "%#{@nickname}%") if @nickname.present?

    players
  end

end
