require 'rails_helper'

RSpec.feature 'User can see root path' do
  scenario 'guest user' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('EarlyBird')
    expect(page).to have_content('Tee Times')
    expect(page).to have_content('Courses')
    expect(page).to have_content('Log in with Google')
    expect(page).to have_content('Find It')
    expect(page).to have_content('Book It')
    expect(page).to have_content('Play It')
  end
end
