# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user_id, scope: :friend_id
  validate :cannot_add_self

  private

  def cannot_add_self
    errors.add(:user_id, 'You cannot add yourself as a friend.') if user_id == friend_id
  end
end
