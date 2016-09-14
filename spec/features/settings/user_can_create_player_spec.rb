require 'rails_helper'

RSpec.feature 'User can create player' do
  xscenario 'logged-in user' do
    current_user = User.create
    setup_for_oauth

    visit '/'

      click_on "Log in with Google"

    click_on "Settings"

    expect(page).to have_content("Players")

    expect(current_path).to eq(settings_path)

    click_on "+"

    expect(current_path).to eq(new_player_path)

    fill_in "Name", with: "Golfer 1"
    fill_in "Phone", with: "+13032222222"

    click_on "Submit"

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Golfer 1")
    expect(page).to have_content("+13032222222")
  end
end
