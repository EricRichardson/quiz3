class Idea < ActiveRecord::Base

  mount_uploader :picture, PictureUploader

  belongs_to :user
  has_many :users, through: :members
  has_many :members, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by_user_id user
  end

  def joined_by?(user)
    members.exists?(user: user)
  end

  def join_for(user)
    members.find_by_user_id user
  end
end
