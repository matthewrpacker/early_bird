class SettingsController < ApplicationController
  def index
    @players = Player.all
    @orders = Order.all

    @orders = Order.last(3)
  end
end
