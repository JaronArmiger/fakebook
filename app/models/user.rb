class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes
  has_and_belongs_to_many :friends,
  						  class_name: "User",
  						  join_table: :friendships,
  						  foreign_key: :user_id,
  						  association_foreign_key: :friend_user_id
  has_many :friend_requests, foreign_key: :from_user_id
  has_many :received_requests, through: :friend_requests, source: :to_user
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def feed
    user_ids = friend_ids << id
    Post.where("user_id IN (#{user_ids.join(', ')})").order(created_at: :desc)
  end
end
