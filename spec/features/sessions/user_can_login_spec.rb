require 'rails_helper'

RSpec.feature 'User can log in' do
  scenario 'user with existing Google account' do
    current_user = User.create(name: "Matt")
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Welcome, Matt")
    expect(page).to have_content("Settings")
    expect(page).to have_content("Log out")
    expect(page).to_not have_content("Log in with Google")
  end
end
