# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.valid?
      @post.save
      flash[:success] = 'Post created'
    else
      flash[:danger] = "Post can't be empty"
    end
    redirect_to current_user
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post deleted'
    redirect_to current_user
  end

  def index
    @posts = Post.all - current_user.posts
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
