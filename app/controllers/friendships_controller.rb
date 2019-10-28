class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @friend = User.find(params[:friend_id])
    if @user.friend?(@friend) || @friend.friend_requests.include?(@user)
      flash[:danger] = 'Friend request not sent'
    else
      Friendship.create(user: @user, friend: @friend)
      flash[:success] = 'Friend request sent'
    end
    redirect_to request.referrer
  end

  def update
  end

  def destroy
    p "XXXXXXXXXXXXXX qqqqq"
    @friendship = Like.find(params[:id].to_i)
    # @user = params[:user_id]
    # @friend = params[:friend_id]

    # @friendship = Friendship.where("user_id = ? AND friend_id = ?", @user, @friend)
    @friendship.destroy
    redirect_to request.referrer
  end
end
