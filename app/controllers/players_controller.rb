class PlayersController < ApplicationController

  before_action :authenticate_player!, only: [
    :show,
    :destroy
  ]
  before_action :set_player, only: [
    :show,
    :destroy
  ]

  def show
    render json: @player
  end

  def create
    player = Player.new(player_params)

    if player.save
      render json: player
    else
      render json: { errors: player.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy

    head :no_content
  end

  private

  def set_player
    @player = current_player
  end

  def player_params
    params.require(:player).permit(
      :nickname,
      :password,
      :password_confirmation,
      setting_attributes: [
        :ansi_coloring
      ]
    )
  end

end
