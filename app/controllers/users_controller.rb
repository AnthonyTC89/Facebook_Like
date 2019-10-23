# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @posts = Post.where('user_id = ?', current_user.posts)
  end
  
  def index
    @users = User.all
  end
end
