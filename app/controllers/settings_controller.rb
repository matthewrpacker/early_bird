class SettingsController < ApplicationController
  def index
    @players = Player.all
  end
end
