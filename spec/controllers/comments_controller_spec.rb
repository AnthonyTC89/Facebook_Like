# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(first_name: 'Test', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:post) { Post.create(user: user, content: 'Post Content') }

  let!(:comment) { Comment.create(user: user, post: post, content: 'Comment Content') }

  describe 'Comment create action' do
    it 'creates a valid post for a logged user' do
      sign_in user
      visit "users/#{user.id}"
      expect(page).to have_content(comment.content)
      expect(Comment.count).to eql(1)
      sign_out user
    end

    it 'tries to create an invalid comment' do
      Comment.create(user: user, post: post, content: '')
      expect(Comment.count).to eql(1)
    end
  end

  describe 'Comment destroy action' do
    it 'destroy a comment' do
      Comment.find(comment.id).destroy
      expect(Comment.count).to eql(0)
    end
  end
end
