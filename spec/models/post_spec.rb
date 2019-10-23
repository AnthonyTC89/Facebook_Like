# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  
  let(:user) do
    User.create!(first_name: 'Foo', email: 'foo@bar.com',
                 password: '123456', password_confirmation: '123456')
  end

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
end
