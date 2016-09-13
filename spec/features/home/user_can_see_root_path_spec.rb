require 'rails_helper'

RSpec.feature 'User can see root path' do
  scenario 'guest user' do
    visit '/'

    expect(current_path).to eq(root_path)

    within("header h1") do
      expect(page).to have_content('EarlyBird')
    end

    within("header nav ul li:nth-child(1)") do
      expect(page).to have_content('Tee Times')
    end

    within("header nav ul li:nth-child(2)") do
      expect(page).to have_content('Courses')
    end

    within("header nav ul li:nth-child(3)") do
      expect(page).to have_content('Log in with Google')
    end

    within("main div:nth-child(1)") do
      expect(page).to have_content('Find It')
    end

    within("main div:nth-child(2)") do
      expect(page).to have_content('Book It')
    end

    within("main div:nth-child(3)") do
      expect(page).to have_content('Play It')
    end
  end
end
