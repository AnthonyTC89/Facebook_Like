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

    it 'after login' do
      User.create(first_name: 'foobar', email: 'foobar@foobar.com', password: '123456')
      user = User.first
      sign_in user
      expect(current_path).to eql user
    end
  end 
end
