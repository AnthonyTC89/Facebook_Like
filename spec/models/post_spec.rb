# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create!(first_name: 'Foo', email: 'foo@bar.com',
                 password: '123456', password_confirmation: '123456')
  end

  let!(:post) { Post.create(user: user, content: 'Post Content') }

  let!(:comment) { Comment.create(user: user, post: post, content: 'Comment Content') }

  describe 'Creating a valid post' do
    it 'Post with valid fields' do
      @post = user.posts.build(content: 'content test')
      expect(@post).to be_valid
    end

    it 'Post without content' do
      @post = user.posts.build
      expect(@post).to_not be_valid
    end

    it 'Post with valid fields' do
      @post = user.posts.build(content: 'p' * 300)
      expect(@post).to_not be_valid
    end

    it 'Post without user' do
      @post = Post.new(content: 'content test')
      expect(@post).to_not be_valid
    end
  end

  describe 'destroy associated objects ' do
    it 'destroy objects associated with posts ' do
      post.likes.create(user: user)
      comment.likes.create(user: user)
      expect(Like.count).to eql(2)
      expect(Comment.count).to eql(1)
      post.destroy
      expect(Post.count).to eql(0)
      expect(Comment.count).to eql(0)
      expect(Like.count).to eql(0)
    end
  end
  
end
