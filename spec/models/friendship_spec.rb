# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:user_2) do
    User.create(first_name: 'Test-2', email: 'test-2@test.com',
                password: 'password', password_confirmation: 'password')
  end

  describe 'Creates and destroys friendships' do
    it 'creates a friendship' do
      Friendship.create(user: user, friend: user_2)
      expect(Friendship.count).to eql(1)
      expect(user_2.friend?(user)).to be_falsey
      expect(user.friend?(user_2)).to be_falsey
      user_2.confirm_friend(user)
      expect(user_2.friend?(user)).to be true
      expect(user.friend?(user_2)).to be true
    end
  end
end
