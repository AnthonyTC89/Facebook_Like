module OmniauthMacros
  def stub_omniauth
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid: "12345678910",
      info: {
        email: "antman@gmail.com",
        first_name: "antman",
        last_name: "antman"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
    })
  end
end