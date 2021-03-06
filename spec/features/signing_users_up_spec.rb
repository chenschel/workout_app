require 'rails_helper'

RSpec.feature 'Sign-up an user' do
  scenario 'with valid credentials' do
    visit '/'

    click_link('Sign up')
    fill_in('First name', with: 'John')
    fill_in('Last name', with: 'Doe')
    fill_in('Email', with: 'john@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')

    expect(page).to have_content('You have signed up successfully.')
    expect(current_path).to eq(root_path)

    logout # signed in users were rejected from members (athletes) array
    visit('/')
    expect(page).to have_content('John Doe')
  end

  scenario 'with invalid inputs' do
    visit '/'

    click_link('Sign up')
    fill_in('First name', with: '')
    fill_in('Last name', with: nil)
    fill_in('Email', with: 'john@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')

    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Last name can\'t be blank')
  end
end
