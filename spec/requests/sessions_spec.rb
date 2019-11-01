# frozen_string_literal: true

RSpec.describe 'Sessions' do
  it 'signs user in and out' do
    user = User.create(first_name: 'Test', email: 'test@test.com',
                       password: 'password', password_confirmation: 'password')
    sign_in user
    visit root_path
    expect(page).to have_content('Test')
    expect(current_path).to eql("/users/#{user.id}")

    sign_out user
    visit root_path
    expect(page).to have_content('Sign up')
    expect(current_path).to eql('/')
  end
end
