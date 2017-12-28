require 'rails_helper'

RSpec.feature 'Sign-up an user' do
  scenario 'with valid credentials' do
    visit '/'

    click_link('Sign up')
    fill_in('Email', with: 'john@example.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')

    expect(page).to have_content('You have signed up successfully.')
    expect(current_path).to eq(root_path)
  end
end
