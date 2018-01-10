require 'rails_helper'

RSpec.feature 'Unfollowing Friend' do
  let(:john) { create(:user) }
  let(:sarah) { create(:user, first_name: 'Sarah') }

  before do
    login_as(john)
    @fiendship = Friendship.create(user: john, friend: sarah)
  end

  scenario do
    visit('/')

    click_link('My Lounge')
    expect(page).to have_content(sarah.full_name)
    link = "a[href='/friendships/#{@fiendship.id}'][data-method='delete']"
    find(link).click

    expect(page.current_path).to eq(user_exercises_path(john.id))
    expect(page).to have_content("#{sarah.full_name} unfollowed")
    expect(page).not_to have_link(sarah.full_name)
  end
end
