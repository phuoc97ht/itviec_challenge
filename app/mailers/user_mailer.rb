class UserMailer < ApplicationMailer
  def notify_post_created(user, post)
    @user = user
    @post = post
    @unsubscribe_url = unsubscribe_url(post_id: @post.id, user_id: @user.id)
    mail(to: user.email, subject: "New Post Created: #{post.title}")
  end
end