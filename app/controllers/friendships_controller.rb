class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def show
    @friend = Friendship.find(params[:id]).friend
    @exercises = @friend.exercises.all
  end

  def create
    friend = User.find(params[:friend_id])
    unless current_user.follows_or_same?(friend)
      Friendship.create!(
        friendship_params.merge!(
          friend_id: params[:friend_id],
          user_id: current_user.id
        )
      )
    end
    redirect_to root_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.delete
    flash[:success] = "#{@friendship.friend.full_name} unfollowed"
    redirect_to user_exercises_path(current_user)
  end

  private

  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end
