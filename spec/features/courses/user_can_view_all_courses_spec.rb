require 'rails_helper'

RSpec.feature 'User can view all courses' do
  scenario 'logged-in user' do
    setup_for_oauth

    visit '/'

    click_on "Log in with Google"
    click_on "Courses"

    expect(current_path).to eq(courses_path)
    expect(page).to have_content("Courses")
    expect(page).to have_selector(".course", count: 12)

    within('.course-list div:nth-child(1)') do
      expect(page).to have_css('img[src*="http://www.cityofdenvergolf.com/images/galleries/overland_park/Overland%20Hole%201a%20NEW.jpg"]')
      expect(page).to have_content("Overland Park")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_link("View Course")
    end
  end
end
