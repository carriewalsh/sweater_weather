class User < ApplicationRecord
  has_many :user_cities
  has_many :cities, through: :user_cities

  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
end
