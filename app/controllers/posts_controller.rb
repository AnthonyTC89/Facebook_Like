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
    redirect_to request.referrer
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post deleted'
    redirect_to request.referrer
  end

  def index
    ids = current_user.friends.pluck(:id) << current_user.id
    @posts = Post.where(user_id: ids)
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
