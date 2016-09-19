require 'rails_helper'

RSpec.feature 'User can use cancel button on new player form' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit settings_path

    click_on "Add Player"

    expect(current_path).to eq(new_player_path)

    click_on "Cancel"

    expect(current_path).to eq(settings_path)
  end
end
