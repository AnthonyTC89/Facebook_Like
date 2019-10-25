# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:post) { Post.create(user: user, content: 'Post Content') }

  let!(:comment) { Comment.create(user: user, post: post, content: 'Comment Content') }

  describe 'destroy associated objects ' do
    it 'destroy likes associated with comment' do
      comment.likes.create(user: user)
      expect(Like.count).to eql(1)
      comment.destroy
      expect(Comment.count).to eql(0)
      expect(Like.count).to eql(0)
    end
  end
end
