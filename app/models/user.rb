class User < ApplicationRecord
  has_secure_password

  validates :email, :first_name, :last_name, :username, presence: true
  validates :email, :username, uniqueness: true

  def full_name 
    "#{self.first_name} #{self.last_name}"
  end
end