require 'rails_helper'

RSpec.describe CollateRatingsPerTutorialService do
  subject { CollateRatingsPerTutorialService.new(tutorial.id) }
  let(:tutorial) { create(:tutorial) }
  let(:expected_average) { 5.3 }
  let(:zero_average) { 0 }

  describe 'when called with normal ratings' do
    let(:rating_one) { create(:review, rating: 10, tutorial_id: tutorial.id) }
    let(:rating_two) { create(:review, rating: 5, tutorial_id: tutorial.id) }
    let(:rating_three) { create(:review, rating: 1, tutorial_id: tutorial.id) }

    it 'returns average of associated tutorials' do
      expect(subject.call).to eq expected_average
    end
  end

  describe 'when called with no ratings' do
    let(:rating_one) { create(:review, rating: 0, tutorial_id: tutorial.id) }
    let(:rating_two) { create(:review, rating: 0, tutorial_id: tutorial.id) }
    let(:rating_three) { create(:review, rating: 0, tutorial_id: tutorial.id) }

    it 'returns zero average of associated tutorials' do
      expect(subject.call).to eq zero_average
    end
  end
end
