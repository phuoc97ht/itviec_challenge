class UserPostsController < ApplicationController
  def unsubscribe
    user_post = UserPost.find_by(user_id: params[:user_id], post_id: params[:post_id])

    if user_post && !post.link_expired?
      user_post.destroy
      flash[:notice] = "You have successfully unsubscribed from notifications for this post."
    else
      flash[:alert] = "You cannot unsubscribe from notifications for this post as the link has expired."
    end

    redirect_to root_path
  end
end