require 'rails_helper'

RSpec.feature 'User can edit player' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    click_on "Settings"
    click_on "Add Player"

    fill_in "Name", with: "Golfer 1"
    fill_in "Phone Number", with: "+13032222222"

    click_on "Submit"

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Golfer 1")
    expect(page).to have_content("+13032222222")
    expect(page).to have_link('Edit')

    click_on 'Edit'

    expect(current_path).to eq("/players/#{Player.last.id}/edit")
    expect(page).to have_content("Edit Player")
    expect(page).to have_field('Name')
    expect(page).to have_field('Phone Number')
    expect(page).to have_button("Submit")
    expect(page).to have_link("Cancel")

    fill_in "Name", with: "Edited Name"
    fill_in "Phone Number", with: "+12223334444"

    click_on 'Submit'

    expect(current_path).to eq(settings_path)
    expect(page).to have_content("Edited Name")
    expect(page).to have_content("+12223334444")
    expect(page).to_not have_content("Golfer 1")
    expect(page).to_not have_content("+13032222222")
  end
end
