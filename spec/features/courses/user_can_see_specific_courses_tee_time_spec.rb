require 'rails_helper'

RSpec.feature 'User can view specific tee time for specific courses' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    
    create_three_players

    visit '/courses/5/tee_times'

    within('.table-body tr:nth-child(3)') do
      expect(page).to have_content("7:20 AM")
      expect(page).to have_content("Tue Nov 01")
      expect(page).to have_content("4")
      expect(page).to have_content("$27.00")
      expect(page).to have_link("Book")
      click_on "Book"
    end

    expect(current_path).to eq('/courses/5/tee_times/7323')
    expect(page).to have_content('Kennedy')
    expect(page).to have_content('10500 East Hampden Avenue')
    expect(page).to have_content('Denver, CO')
    expect(page).to have_content('720-865-0720')

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
      expect(page).to have_button("Confirm Booking")
    end
  end
end
