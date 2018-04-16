require 'rails_helper'

RSpec.describe CollateTutorialsByLanguageService do
  let(:ruby_service) { CollateTutorialsByLanguageService.new(ruby_tutorial) }
  let(:python_service) { CollateTutorialsByLanguageService.new(python_tutorial) }

  let!(:ruby_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:python_tutorial) { create(:tutorial, language: 'python') }
  let!(:second_tutorial) { create(:tutorial, language: 'javascript') }
  let!(:third_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:fourth_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:fifth_tutorial) { create(:tutorial, language: 'python') }
  let!(:sixth_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:seventh_tutorial) { create(:tutorial, language: 'python') }
  let!(:eigth_tutorial) { create(:tutorial, language: 'ruby') }

  context 'when the service is called' do
    it 'returns four ruby tutorials' do
      expect(ruby_service.call).to eq  Hash['first' => third_tutorial,
                                   'second' => fourth_tutorial,
                                   'third' => sixth_tutorial,
                                   'fourth'=> eigth_tutorial]
    end

    it 'returns two python tutorials with no nils' do
      expect(python_service.call).to eq Hash['first' => fifth_tutorial,
                                      'second' => seventh_tutorial]
    end
  end
end
