require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:tutorial) { create(:tutorial, id: 1) }
  let!(:review) { create(:review) }

  describe 'when adding a review' do
    it 'is owned by correct tutorial' do
      expect(Tutorial.first.reviews.pluck(:rating)).to eq [review.rating]
    end
  end
end
