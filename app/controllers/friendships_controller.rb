class FriendshipsController < ApplicationController

  
  def create
    @user = User.find(params[:user_id])
    @friend = User.find(params[:friend_id])
    if @user.friend?(@friend) || @friend.friend_requests.include?(@user)
      #Flash
      p "not created"
    else
      Friendship.create(user_id: @user, friend_id: @friend)
      #Flash
      p "created"
    end
    
  end

  def update
  end

  def destroy
  end
end
