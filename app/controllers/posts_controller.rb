class PostsController < ApplicationController
  def new 
  end

  def create 
    @post = current_user.posts.build(post_params)
    if @post.valid? 
      @post.save
      redirect_to current_user
    else
      render current_user
    end
  end

  def show 
  end

  def destroy 
    Post.find(params[:id]).destroy
    redirect_to current_user
  end

  private 

    def post_params 
      params.require(:post).permit(:content)
    end
end
