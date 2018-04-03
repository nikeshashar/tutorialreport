require 'rails_helper'

RSpec.describe TutorialAcademy, type: :model do
  let(:code_academy) { create(:tutorial_academy) }

  context 'when creating a Tutorial Academy' do
    it 'saves correctly' do
      expect do
        TutorialAcademy.create(FactoryBot
        .attributes_for(:tutorial_academy))
      end
        .to change(TutorialAcademy, :count).by 1
    end
  end
end
