require 'rails_helper'

RSpec.feature 'User can delete player' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    click_on "Settings"

    visit new_player_path

    within('.web') do
      fill_in "Name", with: "Golfer 1"
      fill_in "Phone Number", with: "3032222222"

      click_on "Submit"
    end

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Golfer 1")
    expect(page).to have_content("303-222-2222")
    expect(page).to have_button('Delete')

    within('.web .player-table') do
      click_on 'Delete'
    end

    expect(page).to_not have_content("Golfer 1")
    expect(page).to_not have_content("303-222-2222")
  end
end
