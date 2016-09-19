require 'rails_helper'

RSpec.feature 'From course tee time show' do
  context 'Logged-in user' do
    scenario 'User can go back to course tee times index' do
      setup_for_oauth

      visit '/'

      click_on 'Log in with Google'

      visit '/courses/1/tee_times'

      within('.table-body tr:nth-child(2) td:nth-child(1)') do
        click_on '7:10 AM'
      end

      expect(current_path).to eq('/courses/1/tee_times/2')

      within('.table-body tr') do
        click_on 'Cancel'
      end

      expect(current_path).to eq('/courses/1/tee_times')
    end

    scenario 'User can go back to course show' do
      setup_for_oauth

      visit '/'

      click_on 'Log in with Google'

      visit '/courses/1/tee_times'

      within('.table-body tr:nth-child(2) td:nth-child(1)') do
        click_on '7:10 AM'
      end

      expect(current_path).to eq('/courses/1/tee_times/2')

      click_on 'Overland Park'

      expect(current_path).to eq('/courses/1')
    end
  end
end
