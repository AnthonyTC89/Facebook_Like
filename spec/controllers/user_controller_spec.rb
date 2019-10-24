# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController, type: :controller do
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
end
