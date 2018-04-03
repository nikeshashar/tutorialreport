require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  context 'elastic search test', elasticsearch: true, commit: true do
    let!(:tutorial) { create(:tutorial) }

    before :all do
      Tutorial.__elasticsearch__.create_index! index: Tutorial.index_name
      sleep 1
    end

    it 'should handle case-insensitive searching for a user' do
      get :search, params: { q: 'Awesome Tutorial!' }

      expect(response.body).to include('Awesome Tutorial!')
    end

    after do
      Tutorial.__elasticsearch__.client.indices.delete index: Tutorial.index_name
    end
  end
end
