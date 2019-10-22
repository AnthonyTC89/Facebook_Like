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
  end
end
