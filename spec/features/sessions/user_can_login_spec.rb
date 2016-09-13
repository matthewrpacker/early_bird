require 'rails_helper'

RSpec.feature 'User can log in' do
  scenario 'user with existing Google account' do
    current_user = User.create
    setup_for_oauth

    visit '/'

    within("header nav ul li:nth-child(3)") do
      click_on "Log in with Google"
    end

    expect(current_path).to eq(root_path)

    within("header nav ul li:nth-child(4)") do
      expect(page).to have_content("Hello,#{current_user.name}")
    end

    expect(page).to have_content("Settings")

    within("header nav ul li:nth-child(5)") do
      expect(page).to have_content("Log out")
    end

    expect(page).to_not have_content("Log in with Google")
  end
end
