class CommentsController < ApplicationController
  def new
  end

  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    if @comment.valid?
      @comment.save
      redirect_to current_user
    else
      flash.now[:danger] = "error"
    end
  end 

  def edit
  end

  def destroy
  end

  private 

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
