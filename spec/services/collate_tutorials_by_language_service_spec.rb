require 'rails_helper'

RSpec.describe CollateTutorialsByLanguageService do
  subject { CollateTutorialsByLanguageService.new(tutorial) }

  let!(:tutorial) { create(:tutorial, language: 'ruby') }
  let!(:second_tutorial) { create(:tutorial, language: 'javascript') }
  let!(:third_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:fourth_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:fifth_tutorial) { create(:tutorial, language: 'python') }
  let!(:sixth_tutorial) { create(:tutorial, language: 'ruby') }
  let!(:seventh_tutorial) { create(:tutorial, language: 'python') }
  let!(:eigth_tutorial) { create(:tutorial, language: 'ruby') }

  context 'when the service is called' do
    it 'returns four ruby tutorials' do
      expect(subject.call).to eq  Hash['first' => third_tutorial,
                                   'second' => fourth_tutorial,
                                   'third' => sixth_tutorial,
                                   'fourth'=> eigth_tutorial]
    end
  end

end
