class UsersController < ApplicationController
  def show 
    @posts = Post.where('user_id = ?', current_user)
  end
end
