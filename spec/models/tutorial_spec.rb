require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  before do
    Tutorial.create!(
      name: 'Great Tutorial',
      description: 'Just a fantastic one, awesome',
      average_score: 8
    )
  end

  context 'when creating a Tutorial' do
    it 'saves correctly' do
      expect(Tutorial.first.average_score).to eq 8
    end
  end
end
