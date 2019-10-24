# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe "UsersController", type: :controller do

  include Devise::Test::IntegrationHelpers

  describe 'routes of Devise' do
    it 'will visit root_path' do
      visit root_path
      expect(current_path).to eql '/'
    end
    
    it 'will visit login_path' do
     visit login_path
      expect(current_path).to eql '/login'
    end
    
    it 'will visit signup_path' do
      visit signup_path
      expect(current_path).to eql '/signup'
    end
  end 

  describe 'User controller' do
    let(:user) { User.create(first_name: "Test", email: 'test@test.com', 
       password: "password", password_confirmation: "password") }

    it 'tests User show' do 
      Post.create(user: user, content: 'Post Content')
      sign_in user
      visit root_path
      expect(page).to have_content('Post Content') 
    end

    it 'tests User index' do 
      User.create(first_name: "Test-1", email: 'test-1@test.com', 
                  password: "password", password_confirmation: "password")
      User.create(first_name: "Test-2", email: 'test-2@test.com', 
                  password: "password", password_confirmation: "password")
      sign_in user
      visit '/users'
      expect(page).to have_content('Test-1')
      expect(page).to have_content('Test-2')
    end
  end
end
