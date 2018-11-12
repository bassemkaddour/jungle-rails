class ReviewsController < ApplicationController
  before_action :require_login
  before_action :review_owner, only: [:destroy]

  def create 
    @review = Review.new(review_params)
    @review.user = current_user

    @review.save

    redirect_to product_path(@review.product_id)
  end 

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@review.product), notice: 'Product deleted!'
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
  
  def review_owner
    @review = Review.find params[:id]
    unless @review.user_id == current_user.id
      redirect_to product_path(@review.product) 
    end
  end	
end
