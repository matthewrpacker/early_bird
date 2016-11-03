require 'rails_helper'

RSpec.feature 'User can use cancel button on new player form' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit settings_path

    within('.web .player-table') do
      click_on "Add Player"
    end

    expect(current_path).to eq(new_player_path)

    within('.web') do
      click_on "Cancel"
    end

    expect(current_path).to eq(settings_path)
  end
end
