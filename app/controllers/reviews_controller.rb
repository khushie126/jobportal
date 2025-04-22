class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
   # app/controllers/reviews_controller.rb

  def index
    @reviews = Review.includes(:company, :user).order(created_at: :desc)
    @grouped_reviews = @reviews.group_by { |r| [r.user_id, r.company_id] }
  end
  def new
    @company = Company.find(params[:company_id])
  
    @review = @company.reviews.build(user_id: current_user.id)
  end

  def create
    @company = Company.find(params[:company_id])
    @review = @company.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @company, notice: "Review submitted successfully."
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render :new, status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:category, :point)
  end
end
