class CollateRatingsPerTutorialService
  def initialize(tutorial_id)
    @tutorial_id = tutorial_id
  end

  def call
    calculate_average_of(ratings_array)
  end

  private

  def reviews
    reviews ||= Review.where(tutorial_id: @tutorial_id)
  end

  def ratings_array
    ratings ||= reviews.pluck(:rating)
  end

  def calculate_average_of(array)
    float = array.inject{ |sum, el| sum + el }.to_f / array.size
    float.round(1)
  end
end
