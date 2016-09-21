class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = current_user.players.new(player_params)

    if @player.save
      redirect_to settings_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(player_params)
      redirect_to settings_path
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id]).delete
    redirect_to settings_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone, :user_id)
  end
end
