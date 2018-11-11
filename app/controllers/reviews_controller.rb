class ReviewsController < ApplicationController
  before_action :require_login

  def create 
    @review = Review.new(review_params)
    @review.user = current_user

    @review.save

    redirect_to product_path(@review.product_id)
  end 

  private 
  def review_params
    params.require(:review).permit(
      :rating,
      :description, 
      :product_id
    )
  end 

  def require_login
    unless current_user
      redirect_to login_path
    end 
  end 
end
