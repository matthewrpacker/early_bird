require 'rails_helper'

RSpec.feature 'User can place an order' do
  xscenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    visit '/courses/7/tee_times'

    within('.table-body tr:nth-child(3)') do
      click_on "Book"
    end

    click_on "Confirm Booking"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Evergreen")
    expect(page).to have_content("4")
    expect(page).to have_content("$108.0")
  end
end
