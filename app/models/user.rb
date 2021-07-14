class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recruitments, dependent: :destroy
  has_many :recruit_comments, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :blog_likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy

  attachment :profile_image
end
