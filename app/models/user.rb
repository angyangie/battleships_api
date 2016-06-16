class User < ApplicationRecord
  has_many :scores
  has_many :games, through: :scores
  has_many :ships

  has_secure_password
end
