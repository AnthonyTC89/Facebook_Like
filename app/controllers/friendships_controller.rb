class FriendshipsController < ApplicationController
  def create
    @user = params[:user_id]
    @friend = params[:friend_id]
    Friendship.create(user_id: @user, friend_id: @friend)
  end

  def update
  end

  def destroy
  end
end
