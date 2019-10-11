class User < ActiveRecord::Base
  has_secure_password
  has_many :stories
  validates :username, presence: true
  validates :username, uniqueness: true
end
