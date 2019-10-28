# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PostsController', type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  describe 'Post create' do
    it 'creates a valid post for a logged user' do
      Post.create(user: user, content: 'Post Content')
      sign_in user
      visit "/users/#{user.id}"
      expect(page).to have_content('Post Content')
      expect(Post.count).to eql(1)
      sign_out user
    end

    it 'tries to create an invalid post' do
      Post.create(user: user, content: '')
      sign_in user
      visit "/users/#{user.id}"
      expect(page).to have_content('No posts yet')
      expect(Post.count).to eql(0)
      sign_out user
    end
  end

  describe 'Posts destroy' do
    it 'destroy a post' do
      sign_in user
      Post.create(user: user, content: 'Post Content')
      expect(Post.count).to eql(1)
      visit "/users/#{user.id}"
      expect(page).to have_content('Post Content')
      Post.first.destroy
      expect(Post.count).to eql(0)
      visit "/users/#{user.id}"
      expect(page).to have_content('No posts yet')
      sign_out user
    end
  end

  describe 'Posts index' do
    let!(:friend) do
      User.create(first_name: 'Test-1', email: 'test-1@test.com',
                  password: 'password', password_confirmation: 'password')
    end

    it 'showing a post from an user and other post from a friend' do
      sign_in user

      Post.create(user: user, content: 'Post Content')
      visit '/posts'
      expect(page).to have_content('Post Content')

      Post.create(user: friend, content: 'Friend Post')
      visit '/posts'
      expect(page).to_not have_content('Friend Post')

      Friendship.create(user: user, friend: friend)
      visit '/posts'
      expect(page).to_not have_content('Friend Post')

      friend.confirm_friend(user)
      visit '/posts'
      expect(page).to have_content('Friend Post')

      sign_out user
    end
  end
end
