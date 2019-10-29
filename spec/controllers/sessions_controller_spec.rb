# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SessionsController of OnmiAuth' do
  describe 'Sign in and Logout' do
    it 'can sign in user with Facebook account' do
      visit '/'
      page.should have_content('Sign in')
      stub_omniauth

      click_link 'Sign in with Facebook'
      page.should have_content('antman')
      page.should have_content('Logout')

      click_link 'Logout'
      page.should have_content('Sign in')
    end
  end
end
