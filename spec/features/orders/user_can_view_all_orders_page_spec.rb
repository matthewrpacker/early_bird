require 'rails_helper'

RSpec.feature 'User can view all orders' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    click_on "Settings"
    click_on "View Orders"

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order Number")
    expect(page).to have_content("Date Placed")
    expect(page).to have_content("Course Name")
    expect(page).to have_content("Time")
    expect(page).to have_content("Date")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Unit Price")
    expect(page).to have_content("Total Price")
  end
end
