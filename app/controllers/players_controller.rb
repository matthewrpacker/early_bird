class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @user = current_user

    if @player.save
      @player.update(user_id: @user.id)
      flash[:notice] = "Player Created!!"
      redirect_to settings_path(current_user)
    else
      flash.now[:error] = @player.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone, :user_id)
  end
end
