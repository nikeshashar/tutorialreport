require 'rails_helper'

RSpec.describe Tutorial type: :model do
  let(:tutorial) { create(:tutorial) }

  context 'when creating a Tutorial' do
    it 'saves correctly' do
      expect { Tutorial.create(FactoryBot.attributes_for(:tutorial)) }
        .to change(Tutorial, :count).by 1
    end
  end

  context 'when adding tutorials', elasticsearch: true do
    it 'indexes correctly' do
      # Tutorial.create(title: 'Awesome Tutorial!')
      #
      # Tutorial.__elasticsearch__.refresh_index!

      expect(Tutorial.search('Awesome Tutorial!').records.length).to eq 1
    end
  end
end
