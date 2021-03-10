class PlayerQuerier < ApplicationService

  def initialize(options)
    @term = options[:term]
    @roles = options[:roles]
    @status = options[:status]&.to_sym
  end

  def call
    players = Player.all

    players = players.where("nickname LIKE :term OR email LIKE :term", term: "%#{@term}%")

    players = players.where(role: @roles) if @roles&.count

    players = players.select do |player|
      status_condition(player)
    end

    players
  end

  private

  def status_condition(player)
    case @status
      when :confirmed
        player.confirmed?
      when :unconfirmed
        !player.confirmed?
      when :locked
        player.access_locked?
      else
        true
    end
  end

end
