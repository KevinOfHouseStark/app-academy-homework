require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Create a new user!')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        sign_up_as('Kevin')
        expect(page).to have_content("Welcome Kevin")
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    login_as('Kevin')
    expect(page).to have_content("Welcome Kevin")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_content('Log in')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    login_as('Kevin')
    click_button 'Log Out'
    expect(page).not_to have_content('Kevin')
  end
end