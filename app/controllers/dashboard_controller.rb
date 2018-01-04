# dashboard controller
class DashboardController < ApplicationController
  def index
    @athletes = User.all
    @athletes = @athletes.reject { |user| user.id == current_user.id } if user_signed_in?
  end
end
