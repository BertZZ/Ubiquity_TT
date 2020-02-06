class User < ApplicationRecord
  has_secure_password
  has_many :uploads

  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
end
