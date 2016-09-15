require 'rails_helper'

RSpec.feature 'User can log out' do
  scenario 'user with existing Google account' do
    current_user = User.create(name: "Matt")
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    expect(page).to have_content("Welcome, Matt")
    expect(page).to_not have_content("Log in with Google")

    click_on "Log out"

    expect(page).to have_content("Log in with Google")
    expect(page).to_not have_content("Welcome, Matt")
  end
end
