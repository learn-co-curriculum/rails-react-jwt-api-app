class User < ApplicationRecord
  has_secure_password

  validates :email, :first_name, :last_name, :username, presence: true
  validates :email, :username, uniqueness: true
end