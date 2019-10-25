# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:post) { Post.create(user: user, content: 'Post Content') }

  let!(:comment) { Comment.create(user: user, post: post, content: 'Comment Content') }

  describe 'Likes Create method' do
    it 'Creates a valid like for a post' do
      sign_in user
      expect(Like.count).to eql(0)
      post.likes.create(user: user)
      expect(Like.count).to eql(1)
      visit "/users/#{user.id}"
      expect(page).to have_content('Likes: 1')
      sign_out user
    end

    it 'Creates a valid like for a comment and a post' do
      sign_in user
      expect(Like.count).to eql(0)
      visit "/users/#{user.id}"
      expect(page).to have_content('Likes: 0')
      post.likes.create(user: user)
      expect(Like.count).to eql(1)
      comment.likes.create(user: user)
      expect(Like.count).to eql(2)
      visit "/users/#{user.id}"
      expect(page).to have_content('Likes: 1')
      expect(page).to_not have_content('Likes: 0')
      sign_out user
    end
  end

  describe 'Likes destroy method' do
    it 'create and destroy post and comment likes' do
      sign_in user
      expect(Like.count).to eql(0)
      post.likes.create(user: user)
      comment.likes.create(user: user)
      expect(Like.count).to eql(2)
      post.likes.first.destroy
      expect(Like.count).to eql(1)
      comment.likes.first.destroy
      expect(Like.count).to eql(0)
      visit "/users/#{user.id}"
      expect(page).to_not have_content('Likes: 1')
      expect(page).to have_content('Likes: 0')
      sign_out user
    end
  end
end
