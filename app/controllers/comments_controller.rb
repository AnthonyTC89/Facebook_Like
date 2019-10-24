class CommentsController < ApplicationController
  before_action :authenticate_user!
 
  def new
  end

  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    if @comment.valid?
      @comment.save
      redirect_to request.referrer
    else
      flash[:danger] = "Comment can't be blank"
      redirect_to request.referrer
    end
  end 

  def edit
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = 'Comment deleted'
    redirect_to request.referrer
  end

  private 

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
