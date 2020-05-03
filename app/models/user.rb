class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, foreign_key: :liker_id
  has_many :liked_posts, through: :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
