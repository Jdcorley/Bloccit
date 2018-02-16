module UsersHelper
  def current_user_posts_none?
    current_user.posts.empty?
  end

  def current_user_comments_none?
    current_user.comments.empty?
  end

  def current_user_favorites_none?
    current_user.favorites.empty?
  end
end
