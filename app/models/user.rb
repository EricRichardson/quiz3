class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :nullify

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX }
end
