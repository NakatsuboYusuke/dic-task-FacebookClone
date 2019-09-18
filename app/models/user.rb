class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :birthday, presence: true
  validates :gender, presence: true

  before_validation { email.downcase! }

  enum gender: { "男性": 1, "女性": 2, "カスタム": 3 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
