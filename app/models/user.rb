class User < ActiveRecord::Base
  has_secure_password 
  
  has_many :reviews
  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 1}

  def self.authenticate_with_credentials(email, password) 
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user 
    else 
      nil
    end 
  end 
end