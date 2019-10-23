# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController do
  describe 'routes of Devise gem' do
    it "will visit root_path" do
      visit root_path
      expect(current_path).to eql "/"
    end

    it "will visit login_path" do
      visit login_path
      expect(current_path).to eql "/login"
    end
    
    it "will visit signup_path" do
      visit signup_path
      expect(current_path).to eql "/signup"
    end

    # it "will visit root_path logged" do
    #   User.create(first_name:"foobar", email: "foobar@foobar.com", password: "123456")
    #   visit login_path

    #   fill_in('user_email', with: 'foobar@foobar.com')
    #   fill_in('user_password', with: '123456')
    #   click_button 'Log in'
    #   expect(current_path).to eql "/users/show"
    # end
  end
end 