require 'rails_helper'

RSpec.feature 'User can edit player' do
  context 'logged-in user' do
    scenario 'with proper information' do
      setup_for_oauth

      visit '/'

      click_on "Log in with Google"
      click_on "Settings"

      visit new_player_path

      within('.web') do
        fill_in "Name", with: "Golfer 1"
        fill_in "Phone Number", with: "3032222222"

        click_on "Submit"
      end

      expect(current_path).to eq(settings_path)
      expect(page).to have_content("Golfer 1")
      expect(page).to have_content("303-222-2222")
      expect(page).to have_link('Edit')

      within('.web .player-table') do
        click_on 'Edit'
      end

      expect(current_path).to eq("/players/#{Player.last.id}/edit")
      expect(page).to have_content("Edit Player")
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone Number')
      expect(page).to have_button("Submit")
      expect(page).to have_link("Cancel")

      within('.web') do
        fill_in "Name", with: "Edited Name"
        fill_in "Phone Number", with: "2223334444"

        click_on 'Submit'
      end

      expect(current_path).to eq(settings_path)
      expect(page).to have_content("Edited Name")
      expect(page).to have_content("222-333-4444")
      expect(page).to_not have_content("Golfer 1")
      expect(page).to_not have_content("303-222-2222")
    end
  end
end
