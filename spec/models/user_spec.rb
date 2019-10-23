# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creating a valid User' do
    it 'User with valid fields' do
      @user = User.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com',
                       password: '123456', password_confirmation: '123456', gender: 'male',
                       birthday: Time.now, phone: '9898989898')
      expect(@user).to be_valid
    end

    it 'User with long first name' do
      @user = User.new(first_name: 'p' * 51, email: 'foo@bar.com',
                       password: '123456', password_confirmation: '123456')
      expect(@user).to_not be_valid
    end

    it 'User with main fields' do
      @user = User.new(first_name: 'Foo', email: 'foo@bar.com',
                       password: '123456', password_confirmation: '123456')
      expect(@user).to be_valid
    end

    it 'User with empty field' do
      @user = User.new
      expect(@user).to_not be_valid
    end

    it 'User with wrong password confirmation' do
      @user = User.new(first_name: 'Foo', email: 'foo@bar.com',
                       password: '123456', password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'User with invalid email' do
      @user = User.new(first_name: 'Foo', email: 'foobar.com',
                       password: '123456', password_confirmation: '1234567')
      expect(@user).to_not be_valid
    end

    it 'User with invalid password' do
      @user = User.new(first_name: 'Foo', email: 'foobar.com',
                       password: '123', password_confirmation: '123')
      expect(@user).to_not be_valid
    end
  end
end
