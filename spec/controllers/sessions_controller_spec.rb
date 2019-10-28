require 'rails_helper'

RSpec.describe 'SessionsController' do

  def stub_omniauth
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    p "RUNNINGGGGGGGGGGGGGGGGG"

    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid: "12345678910",
      info: {
        email: "jesse@mountainmantechnologies.com",
        first_name: "Jesse",
        last_name: "Spevack"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
    })
  end

  describe "access top page" do

    it "can sign in user with Facebook account" do
      visit '/'
      page.should have_content("Sign in")
      stub_omniauth
      click_link "Sign in with Facebook"
      #page.should have_content("mockuser")  # user name
      #page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
      page.should have_content("Logout")
    end
  end

  
end

