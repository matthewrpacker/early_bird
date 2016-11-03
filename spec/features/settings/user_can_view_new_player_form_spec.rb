require 'rails_helper'

RSpec.feature 'User can view new player form' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    click_on "Settings"

    visit new_player_path

    expect(page).to have_content("Add a Player")
    expect(page).to have_field('Name')
    expect(page).to have_field('Phone Number')
    expect(page).to have_button("Submit")
    expect(page).to have_link("Cancel")
  end
end
