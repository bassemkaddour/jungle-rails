class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, :user_id, :product_id, :description, presence: true
end
