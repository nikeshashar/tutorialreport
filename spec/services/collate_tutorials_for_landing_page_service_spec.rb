require 'rails_helper'

RSpec.describe CollateTutorialsForLandingPageService do
  subject { CollateTutorialsForLandingPageService.new }

  let(:subject2) { CollateTutorialsForLandingPageService.new }

  describe 'when called with one appropriate tutorial' do
    let!(:tutorial1) { create(:tutorial, rating: 4) }
    let!(:tutorial2) { create(:tutorial, rating: 8) }
    let!(:tutorial3) { create(:tutorial, rating: 3) }

    it 'returns 4 correct tutorials (rating 7+)' do
      expect(subject.call).to eq Hash[first: tutorial2]
    end
  end

  describe 'when called with multiple tutorials' do
    let!(:tutorial1) { create(:tutorial, rating: 4) }
    let!(:tutorial2) { create(:tutorial, rating: 8) }
    let!(:tutorial3) { create(:tutorial, rating: 7) }
    let!(:tutorial4) { create(:tutorial, rating: 9) }
    let!(:tutorial5) { create(:tutorial, rating: 10) }
    let!(:tutorial6) { create(:tutorial, rating: 10) }
    let!(:tutorial7) { create(:tutorial, rating: 9) }

    it 'returns 4 correct tutorials (rating 7+)' do
      tutorial_ratings = subject.call.map { |k,v| v.rating }

      expect(tutorial_ratings).not_to include 4
    end

    it 'returns random responses' do
      expect(subject.call).not_to eq subject2.call
    end
  end
end
