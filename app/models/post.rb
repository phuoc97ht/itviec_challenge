class Post < ApplicationRecord
  has_many :user_posts
  has_many :users, through: :user_posts

  validates :code, presence: true, uniqueness: true
  validates :title, presence: true

  def link_expired?
    link_expire_at < Time.current
  end
end
