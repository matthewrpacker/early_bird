require 'rails_helper'

RSpec.feature 'User can view all courses' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"

    click_on "Courses"

    expect(current_path).to eq(courses_path)
    expect(page).to have_content("Courses")
    expect(page).to have_content("Course Image")
    expect(page).to have_content("Course Name")
    expect(page).to have_content("Course Location")
    expect(page).to have_link("View Course")
  end
end
