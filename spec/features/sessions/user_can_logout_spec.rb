require 'rails_helper'

RSpec.feature 'User can log out' do
  scenario 'user with existing Google account' do
    current_user = User.create
    setup_for_oauth

    visit '/'

    within("header nav ul li:nth-child(3)") do
      click_on "Log in with Google"
    end

    within("header nav ul li:nth-child(4)") do
      expect(page).to have_content("Hello,#{current_user.name}")
    end

    expect(page).to_not have_content("Log in with Google")

    within("header nav ul li:nth-child(5)") do
      click_on "Log out"
    end

    expect(page).to have_content("Log in with Google")
    expect(page).to_not have_content("Hello,#{current_user.name}")
  end
end
