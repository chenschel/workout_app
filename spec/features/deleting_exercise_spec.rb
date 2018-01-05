require 'rails_helper'

RSpec.feature 'Deleting Exercise' do
  before do
    @owner = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    login_as(@owner)
    @owner_exer = @owner.exercises.create!(duration_in_min: 45, workout: 'My first Workout', workout_date: Date.current)
  end

  scenario do
    visit('/')
    click_link('My Lounge')
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content('Exercise has been deleted')
    expect(page.current_path).to eq(user_exercises_path(@owner))
  end
end
