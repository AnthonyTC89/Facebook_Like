

RSpec.describe "Sessions" do
  it "signs user in and out" do
    # user = create(:user)    ## uncomment if using FactoryBot
    user = User.create(first_name: "Test", email: 'test@test.com', 
      password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
    sign_in user
    visit root_path
    expect(page).to have_content('Test') 
    expect(current_path).to eql("/users/show") # add gem 'rails-controller-testing' to your Gemfile first.
    
    sign_out user
    visit root_path
    expect(page).to have_content('Sign up') 
    expect(current_path).to eql("/")
    #expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
  end
end