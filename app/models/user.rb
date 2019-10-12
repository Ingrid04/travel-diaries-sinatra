class User < ActiveRecord::Base
  has_secure_password
  has_many :stories
  validates :email, :username, presence: true
  validates :email, uniqueness: true
end
