class User < ApplicationRecord
  has_many :user_posts
  has_many :posts, through: :user_posts

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end