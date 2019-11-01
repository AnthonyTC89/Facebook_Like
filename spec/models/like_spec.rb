# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:post) { Post.create(user: user, content: 'Post Content') }

  let!(:comment) { Comment.create(user: user, post: post, content: 'Comment Content') }

  describe 'Creates and destroy likes' do
    it 'creates likes' do
      comment.likes.create(user: user)
      expect(Like.count).to eql(1)
      post.likes.create(user: user)
      expect(Like.count).to eql(2)
    end

    it 'destroys likes' do
      post.likes.create(user: user)
      expect(Like.count).to eql(1)
      comment.likes.create(user: user)
      expect(Like.count).to eql(2)
      post.likes.first.destroy
      expect(Like.count).to eql(1)
      comment.likes.first.destroy
      expect(Like.count).to eql(0)
    end
  end
end
