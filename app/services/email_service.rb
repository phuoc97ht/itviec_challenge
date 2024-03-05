class EmailService
  def self.create_post_and_notify_users(post_params)
    # Create the post
    post = Post.new(post_params)
    post.link_expire_at = 3.days.from_now
    # Send email to each user
    if post.save
      notify_users(post)
    else
      # Handle error if post creation fails
      Rails.logger.error("Failed to create post: #{post.errors.full_messages}")
    end
  end

  private

  def self.notify_users(post)
    post.users.each do |user|
      UserMailer.notify_post_created(user, post).deliver_now
    end
  end
end