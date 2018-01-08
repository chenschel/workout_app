require 'rails_helper'

RSpec.feature 'Listing exercises' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Doe', email: 'sarah@example.com', password: 'password')
    login_as(@john)

    @e1 = Exercise.create(duration_in_min: 20, workout: 'Exercise one', workout_date: Date.current, user: @john)
    @e2 = Exercise.create(duration_in_min: 30, workout: 'Exercise two', workout_date: Date.current, user: @john)
    @e3 = Exercise.create(duration_in_min: 45, workout: 'Exercise three', workout_date: Date.current, user: @sarah)
    @e4 = Exercise.create(duration_in_min: 40, workout: 'Exercise four', workout_date: Date.current, user: @sarah)

    @friendship = Friendship.create!(user: @john, friend: @sarah)
  end

  scenario 'show exercises for the next seven days' do
    visit '/'
    click_link('My Lounge')

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

  scenario 'shows a list of users friends' do
    visit '/'

    click_link('My Lounge')
    expect(page).to have_content('My Friends')
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link('Unfollow')
  end
end
