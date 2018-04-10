class ReviewsController <ApplicationController
  def new
    @review = Review.new
    puts "This IS DA TING YO #{@review}"
  end

  def create
    @review = Review.new(reviews_params)
    @review.tutorial_id = session[:passed_tutorial_id]
    @review.save!
    redirect_to "/tutorials/#{session[:passed_tutorial_id]}"
  end

  private

  def reviews_params
    params.require(:review).permit(:description)
  end


end
