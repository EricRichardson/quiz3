class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by_user_id user
  end
end
