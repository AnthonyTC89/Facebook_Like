require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  include Devise::Test::IntegrationHelpers

  let!(:user_1) do
    User.create(first_name: 'Test-1', email: 'test-1@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:user_2) do
    User.create(first_name: 'Test-2', email: 'test-2@test.com',
                password: 'password', password_confirmation: 'password')
  end

  describe 'actions with friendships' do
    it 'sending a request for friendship' do
      sign_in user_1
      visit "/users"
      expect(page).to have_content('Test-2')
      page.should have_selector(:link_or_button, 'Friend Request')
      Friendship.create(user: user_1, friend: user_2)
      visit "/users"
      page.should have_selector(:link_or_button, 'Cancel Request')
      expect(Friendship.count).to eql(1)
      expect(Friendship.first.confirmed).to be_falsey
      sign_out user_1
    end

    it 'accepting a request for friendship' do
      Friendship.create(user: user_1, friend: user_2)
      expect(Friendship.count).to eql(1)
      expect(Friendship.first.confirmed).to be_falsey
      sign_in user_2
      visit "/users"
      page.should have_selector(:link_or_button, 'Accept Request')
      user_2.confirm_friend(user_1)
      visit "/users"
      page.should have_selector(:link_or_button, 'Cancel Friendship')
      expect(Friendship.count).to eql(1)
      expect(Friendship.first.confirmed).to be true
      sign_out user_2
    end
  end
end