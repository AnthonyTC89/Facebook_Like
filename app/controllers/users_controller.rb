class UsersController < ApplicationController
  def new
    @user = User.new
   end
   
  def create
    # user = User.new(params_user)
    # if user.valid?
    #   user.save
    #   session[:user_id] = user.id
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  def show 

  end

  #  private 

  #   def params_user
  #     params.require(:user).permit(:name, :email)
  #   end
end
