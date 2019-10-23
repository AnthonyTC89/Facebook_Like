# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController do
  describe 'routes of Devise' do
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
  end
end 