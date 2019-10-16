class UsersController < ApplicationController
  def new
    @user = User.new
   end
   
   def create
    user = User.new(name: params[:user][:name])
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    session[:user_id] = user.id
    redirect_to hello_path
   end
end
