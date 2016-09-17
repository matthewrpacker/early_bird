require 'rails_helper'

RSpec.feature 'User can view new player form' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on 'Log in with Google'

    click_on 'Courses'

    expect(current_path).to eq(courses_path)

    within('.course-list div:nth-child(1)') do
      click_on 'View Course'
    end

    expect(current_path).to eq('/courses/1')

    click_on "Back"

    expect(current_path).to eq(courses_path)
  end
end
