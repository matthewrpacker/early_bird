require 'rails_helper'

RSpec.feature 'User can view dashboard' do
  scenario 'logged-in user' do
    current_user = User.create
    setup_for_oauth

    visit '/'

    within("header nav ul li:nth-child(3)") do
      click_on "Log in with Google"
    end

    click_on "Settings"

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Manage Account")
    expect(page).to have_content("#{current_user.name}")
    expect(page).to have_content("Manage Players")
    expect(page).to have_content("View Orders")
  end
end
