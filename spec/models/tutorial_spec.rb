require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  let(:tutorial) { create(:tutorial) }

  context 'when creating a Tutorial' do
    it 'saves correctly' do
      expect { Tutorial.create(FactoryBot.attributes_for(:tutorial)) }
        .to_change(Tutorial, :count).by 1
    end
  end
end
