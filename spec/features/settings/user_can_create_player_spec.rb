require 'rails_helper'

RSpec.feature 'User can create player' do
  context 'logged-in user' do
    scenario 'with proper information' do
      setup_for_oauth

      visit '/'

      click_on "Log in with Google"
      click_on "Settings"

      expect(current_path).to eq(settings_path)

      visit new_player_path

      within('.web') do
        fill_in "Name", with: "Golfer 1"
        fill_in "Phone Number", with: "3032222222"

        click_on "Submit"
      end

      expect(current_path).to eq(settings_path)
      expect(page).to have_content("Golfer 1")
      expect(page).to have_content("303-222-2222")
    end

    scenario 'without proper information' do
      setup_for_oauth

      visit '/'

      click_on "Log in with Google"
      click_on "Settings"

      expect(current_path).to eq(settings_path)

      visit new_player_path

      within('.web') do
        fill_in "Name", with: "Golfer 1"
        fill_in "Phone Number", with: nil

        click_on "Submit"
      end

      expect(page).to have_content("Add a Player")
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone Number')
      expect(page).to have_button("Submit")
      expect(page).to have_link("Cancel")
    end
  end
end
