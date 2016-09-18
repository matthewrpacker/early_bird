require 'rails_helper'

RSpec.feature 'User can view all tee times for specific course' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit 'courses/1'

    within('.course') do
      click_on "Tee Times"
    end

    expect(current_path).to eq('/courses/1/tee_times')
    expect(page).to have_link('Overland Park')
    expect(page).to have_content('1801 S. Huron St.')
    expect(page).to have_content('Denver, CO')
    expect(page).to have_content('720-865-0430')

    within('.table-head') do
      expect(page).to have_content("Time")
      expect(page).to have_content("Date")
      expect(page).to have_content("Available")
      expect(page).to have_content("Unit Price")
      expect(page).to have_content("Purchase")
    end

    within('.table-body tr:nth-child(1)') do
      expect(page).to have_link("7:00 AM")
      expect(page).to have_content("Tue Nov 01")
      expect(page).to have_content("4")
      expect(page).to have_content("$27.00")
      expect(page).to have_link("Book")
    end
  end
end
