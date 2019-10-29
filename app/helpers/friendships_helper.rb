# frozen_string_literal: true

module FriendshipsHelper
  def find_friendship(user, friend)
    Friendship.where('user_id = ? and friend_id = ?', user.id, friend.id).first
  end
end
