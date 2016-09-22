require 'rails_helper'

RSpec.feature 'From course tee time show' do
  context 'Logged-in user' do
    xscenario 'User can go back to course show' do
      setup_for_oauth

      visit '/'

      click_on 'Log in with Google'

      visit '/courses/1/tee_times/3'

      click_on 'Overland Park'

      expect(current_path).to eq('/courses/1')
    end
  end
end
