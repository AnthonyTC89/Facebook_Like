class LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    @like = Like.new()
  end

  def create
    @like = Like.new(user: current_user, likeable_id: params[:id].to_i, 
      likeable_type: params[:type])
    @like.save
    redirect_to current_user
  end

  def destroy
    @like = Like.find(params[:id].to_i)
    @like.destroy
    redirect_to current_user
  end
end
