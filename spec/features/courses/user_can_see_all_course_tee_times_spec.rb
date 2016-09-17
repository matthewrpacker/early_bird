require 'rails_helper'

RSpec.feature 'User can view all courses' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit 'courses/1'

    within('.course p:nth-child(3)') do
      click_on "Tee Times"
    end

    expect(current_path).to eq('/courses/1/tee_times')

    within('.table-head') do
      expect(page).to have_content("Time")
      expect(page).to have_content("Date")
      expect(page).to have_content("Available")
      expect(page).to have_content("Unit Price")
      expect(page).to have_content("Purchase")
    end

    within('.table-body tr:nth-child(1)') do
      expect(page).to have_content("7:00 AM")
      expect(page).to have_content("Tue Nov 01")
      expect(page).to have_content("4")
      expect(page).to have_content("$27.00")
      expect(page).to have_link("Book")
    end

  end
end
