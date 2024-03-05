class PostsController < ApplicationController
  def create
    post_params = params.require(:post).permit(:title, :content, :code, :link_expire_at)
    EmailService.create_post_and_notify_users(post_params)

    redirect_to root_path
  end
end