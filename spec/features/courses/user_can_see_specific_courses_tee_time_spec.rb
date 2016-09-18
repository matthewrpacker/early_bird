require 'rails_helper'

RSpec.feature 'User can view specific tee time for specific courses' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit '/courses/1/tee_times'

    within('.table-body tr:nth-child(3)') do
      expect(page).to have_content("7:20 AM")
      expect(page).to have_content("Tue Nov 01")
      expect(page).to have_content("4")
      expect(page).to have_content("$27.00")
      expect(page).to have_link("Book")
      click_on "Book"
    end

    expect(current_path).to eq('/courses/1/tee_times/3')
    expect(page).to have_content('Overland Park')
    expect(page).to have_content('1801 S. Huron St.')
    expect(page).to have_content('Denver, CO')
    expect(page).to have_content('720-865-0430')

    within('.table-head tr') do
      expect(page).to have_content('Time')
      expect(page).to have_content('Date')
      expect(page).to have_content('Players')
      expect(page).to have_content('Unit Price')
      expect(page).to have_content('Purchase')
    end

    within('.table-body tr') do
      expect(page).to have_content("7:20 AM")
      expect(page).to have_content("Tue Nov 01")
      expect(page).to have_content("4")
      expect(page).to have_content("$27.00")
      expect(page).to have_link("Book")
      expect(page).to have_link("Cancel")
    end
  end
end