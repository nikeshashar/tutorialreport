require 'rails_helper'

RSpec.describe CollateTutorialsForLandingPageService do
  subject { CollateTutorialsForLandingPageService.new }

  let!(:tutorial1) { create(:tutorial, rating: 4) }
  let!(:tutorial2) { create(:tutorial, rating: 8) }
  let!(:tutorial3) { create(:tutorial, rating: 7) }
  let!(:tutorial4) { create(:tutorial, rating: 9) }
  let!(:tutorial5) { create(:tutorial, rating: 10) }

  describe 'when called' do
    it 'returns correct tutorial' do
      expect(subject.call).to include Hash[first: tutorial2]
    end

    it 'returns 4 correct tutorials (rating 7+)' do
      expect(subject.call).to eq Hash[
       first: tutorial2,
       second: tutorial3,
       third: tutorial4,
       fourth: tutorial5 ]
    end

    it 'does not return incorrect tutorials (rating below 7)' do
      expect(subject.call).not_to include [tutorial1]
    end

    it 'returns random responses' do
      result1 = subject.call
      result2 = subject.call

      expect(result1).not_to eq result2
    end
  end
end
