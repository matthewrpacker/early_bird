require 'rails_helper'

RSpec.feature 'User can go back to course show from course tee times index' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on 'Log in with Google'

    visit '/courses/1'

    within('.web-tee-time-btn') do
      click_on 'Tee Times'
    end

    expect(current_path).to eq('/courses/1/tee_times')

    within('.table h2') do
      click_on 'Overland Park'
    end

    expect(current_path).to eq('/courses/1')
  end
end
