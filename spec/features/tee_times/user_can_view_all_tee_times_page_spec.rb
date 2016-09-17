require 'rails_helper'

RSpec.feature 'User can view all tee times' do
  xscenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    click_on "Tee Times"

    expect(current_path).to eq(tee_times_path)
    expect(page).to have_content("Course")
    expect(page).to have_content("Time")
    expect(page).to have_content("Date")
    expect(page).to have_content("Unit Price")
    expect(page).to have_content("Book")
  end
end
