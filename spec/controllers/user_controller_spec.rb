# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe "Users Controller" do

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

    # it "signs me in" do
    #   user = User.create(first_name: 'foobar', email: 'foobar@foobar.com', 
    #     password: '123456', password_confirmation: '123456')
    #   login(user)
    #   visit "/users/show"
    #   expect(page).to have_content 'Success'
    # end
  end 

  describe ' User controller' do
    let(:user) {User.create(first_name: "Test1", email: 'test@test1.com', 
       password: "password", password_confirmation: "password") }

    it 'An User can show his posts' do 

      Post.create(user: user, content: 'Post Content')
      sign_in user
      visit root_path
      expect(page).to have_content('Post Content') 
    end
  end
end
