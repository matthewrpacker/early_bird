require 'rails_helper'

RSpec.feature 'User can add their own phone number' do
  context 'logged-in user' do
    scenario 'user provides proper information' do
      setup_for_oauth

      visit '/'

      click_on "Log in with Google"
      click_on "Settings"

      current_user = User.last

      expect(current_path).to eq(settings_path)
      expect(current_user.name).to eq('Matt')
      expect(current_user.phone).to eq('3334445555')

      click_on 'My Number'

      expect(current_path).to eq(edit_user_path(current_user))

      expect(page).to have_content("My Number")
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone Number')
      expect(page).to have_button("Submit")
      expect(page).to have_link("Cancel")

      fill_in "Name", with: "Matt"
      fill_in "Phone Number", with: "2223334444"

      click_on 'Submit'

      expect(current_path).to eq(settings_path)

      expect(page).to have_content('Matt')
      expect(page).to have_content('222-333-4444')
    end

    scenario 'user does not provide proper information' do
      setup_for_oauth

      visit '/'

      click_on "Log in with Google"
      click_on "Settings"

      current_user = User.last

      expect(current_path).to eq(settings_path)
      expect(current_user.name).to eq('Matt')
      expect(current_user.phone).to eq('3334445555')

      click_on 'My Number'

      expect(current_path).to eq(edit_user_path(current_user))

      expect(page).to have_content("My Number")
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone Number')
      expect(page).to have_button("Submit")
      expect(page).to have_link("Cancel")

      fill_in "Name", with: nil
      fill_in "Phone Number", with: "2223334444"

      click_on 'Submit'

      expect(page).to have_content("My Number")
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone Number')
      expect(page).to have_button("Submit")
      expect(page).to have_link("Cancel")
    end
  end
end
