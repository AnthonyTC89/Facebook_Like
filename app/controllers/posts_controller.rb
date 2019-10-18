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
    p @post
  end

  def show 
    @posts = Post.where('user_id = ?', current_user)
  end

  def delete 
  end

  private 

    def post_params 
      params.require(:post).permit(:content)
    end
end
