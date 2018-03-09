require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  context 'when creating a Tutorial' do
    it 'saves correctly' do
      Tutorial.create!(
        name: 'Great Tutorial',
        description: 'Just a fantastic one, awesome',
        average_score: 8
      )

      expect(Tutorial.count).to eq 1
      expect(Tutorial.first.name).to eq 'Great Tutorial'
      expect(Tutorial.first.description).to eq 'Just a fantastic one, awesome'
      expect(Tutorial.first.average_score).to eq 8
    end
  end
end
