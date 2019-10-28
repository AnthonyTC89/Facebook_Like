# frozen_string_literal: true

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
    Friendship.find(params[:id].to_i).update_column(:confirmed, true)
    flash[:success] = 'Friendship accepted'
    redirect_to request.referrer
  end

  def destroy
    @friendship = Friendship.find(params[:id].to_i)
    @friendship.destroy
    flash[:success] = 'Friendship destroyed'
    redirect_to request.referrer
  end
end
