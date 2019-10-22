class LikesController < ApplicationController
  def new
    @like = Like.new()
  end

  def create
    @post = Post.find(params[:post].to_i)
    @like = @post.likes.build()
    @like.user = current_user
    @like.save
    redirect_to current_user 
  end

  def destroy
    @post = params[:post].to_i
    @like = Like.where('post_id = ? AND user_id = ?', @post, current_user)
    p @like 
    @like.destroy
    redirect_to current_user
  end
end
