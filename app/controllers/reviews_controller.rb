class ReviewsController <ApplicationController
  # To be implemented here :authenticate
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.tutorial_id = session[:passed_tutorial_id]
    @review.save!
    redirect_to "/tutorials/#{session[:passed_tutorial_id]}"
  end

  private

  def reviews_params
    params.require(:review).permit(:rating)
  end
end
