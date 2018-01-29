module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end 
  def user_is_authorized_to_edit_post?(post)
    current_user.moderator? && (current_user != post.user)
  end 
end
