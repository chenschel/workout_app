class Exercise < ApplicationRecord
  belongs_to :user

  validates :duration_in_min, :workout, :workout_date, :user_id, presence: true
  validates :duration_in_min, numericality: { only_integer: true }

  default_scope { where('workout_date > ?', 7.days.ago).order(workout_date: :desc) }
end
