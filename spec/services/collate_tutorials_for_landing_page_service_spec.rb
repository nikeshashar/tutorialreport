require 'rails_helper'

RSpec.describe CollateTutorialsForLandingPageService do
  let!(:tutorial) { create(:tutorial, rating: 4) }
  let!(:second_tutorial) { create(:tutorial, rating: 8) }

  describe 'when called' do
    it 'returns correct tutorial' do
      expect(CollateTutorialsForLandingPageService.new.call).to eq Hash[first: second_tutorial]
    end
  end
end
