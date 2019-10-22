class LikesController < ApplicationController
  def new
    @like = Like.new()
  end

  def create
    @like = Like.new(user: current_user, likeable_id: params[:id].to_i, 
      likeable_type: params[:type])
    @like.save
    render :template => 'users/show'
  end

  def destroy
    @like = Like.find(params[:id].to_i)
    @like.destroy
    render :template => 'users/show'
  end
end
