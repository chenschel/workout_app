require 'rails_helper'

RSpec.feature 'Seaching for Users on Homepage' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Doe', email: 'sarah@example.com', password: 'password')
  end

  scenario 'with existing name returns all those users' do
    visit('/')

    fill_in('search_name', with: 'Doe')
    click_button('Search')

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(page.current_path).to eq('/dashboard/search')
  end

  scenario 'with existing name returns all those users' do
    visit('/')

    fill_in('search_name', with: 'Sarah')
    click_button('Search')

    expect(page).not_to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(page.current_path).to eq('/dashboard/search')
  end
end