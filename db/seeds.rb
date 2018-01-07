# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {
      first_name: 'John1',
      last_name: 'Doe1',
      email: 'john1@example.com',
      password: 'password'
    },
    {
      first_name: 'John2',
      last_name: 'Doe2',
      email: 'john2@example.com',
      password: 'password'
    },
    {
      first_name: 'John3',
      last_name: 'Doe3',
      email: 'john3@example.com',
      password: 'password'
    },
    {
      first_name: 'John4',
      last_name: 'Doe4',
      email: 'john4@example.com',
      password: 'password'
    },
    {
      first_name: 'John5',
      last_name: 'Doe5',
      email: 'john5@example.com',
      password: 'password'
    },
    {
      first_name: 'John6',
      last_name: 'Doe6',
      email: 'john6@example.com',
      password: 'password'
    },
    {
      first_name: 'John7',
      last_name: 'Doe7',
      email: 'john7@example.com',
      password: 'password'
    },
    {
      first_name: 'John8',
      last_name: 'Doe8',
      email: 'john8@example.com',
      password: 'password'
    },
    {
      first_name: 'John9',
      last_name: 'Doe9',
      email: 'john9@example.com',
      password: 'password'
    },
    {
      first_name: 'John10',
      last_name: 'Doe10',
      email: 'john10@example.com',
      password: 'password'
    },
    {
      first_name: 'John11',
      last_name: 'Doe11',
      email: 'john11@example.com',
      password: 'password'
    },
    {
      first_name: 'John12',
      last_name: 'Doe12',
      email: 'john12@example.com',
      password: 'password'
    },
    {
      first_name: 'John13',
      last_name: 'Doe13',
      email: 'john13@example.com',
      password: 'password'
    },
  ]
)

users.each do |user|
  (3..rand(5..9)).each do |number|
    user.exercises.create(
      workout: "Workout #{number}",
      duration_in_min: rand(25..120),
      workout_date: rand(2..10).days.from_now
    )
  end
end
