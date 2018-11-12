class User < ActiveRecord::Base
  has_secure_password 
  
  has_many :reviews
  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8}
end