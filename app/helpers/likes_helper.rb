module LikesHelper
  def current_user_like?(object)
    object.likes.where("user_id = ?", current_user.id).first
  end
end
