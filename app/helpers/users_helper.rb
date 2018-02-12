module UsersHelper
  
  def current_user_posts_none
    current_user.posts.length == 0 
  end 

  def current_user_comments_none
    current_user.comments.length == 0
  end 
end
