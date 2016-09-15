require 'rails_helper'

RSpec.feature 'User can view individual order' do
  xscenario 'logged-in user' do
    setup_for_oauth
    user = User.last
    order = user.orders.create

    visit '/'

    click_on "Log in with Google"
    click_on "Settings"
    click_on "View Orders"
    click_on "Order Details"

    expect(current_path).to eq(order_path(order))

    expect(page).to have_content("Order Details")
    expect(page).to have_content("Order Number")
    expect(page).to have_content("Date Placed")
    expect(page).to have_content("Tee Time")
    expect(page).to have_content("Date")
    expect(page).to have_content("Players")
    expect(page).to have_content("Unit Price")
    expect(page).to have_content("Total")
    expect(page).to have_content("Confirmation Code")
    expect(page).to have_content("Sent To:")
    expect(page).to have_content("Player 1")
    expect(page).to have_content("Phone Number")
  end
end
