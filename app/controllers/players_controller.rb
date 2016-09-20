class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.new(player_params)

    if @player.save
      flash[:notice] = "Player Created!"
      redirect_to settings_path
    else
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone, :user_id)
  end
end
