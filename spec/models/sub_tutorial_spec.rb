require 'rails_helper'

RSpec.describe SubTutorial, type: :model do
  let(:tutorial) { create(:tutorial) }

  context 'when creating a Tutorial' do
    it 'saves correctly' do
      expect { SubTutorial.create(FactoryBot.attributes_for(:sub_tutorial)) }
        .to change(SubTutorial, :count).by 1
    end
  end
end
