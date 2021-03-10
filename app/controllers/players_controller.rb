class PlayersController < ApplicationController

  before_action :authenticate_player!

  before_action :set_player, only: [:show, :destroy]

  def index
    authorize Player

    @players = PlayerQuerier.call(
      {
        term: params[:term],
        roles: params[:roles],
        status: params[:status]
      }
    )

    render json: @players
  end

  def show
    render json: @player
  end

  # TODO: needed? Or use devise-token-auth?
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
