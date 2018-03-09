require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do
  let(:tutorial) { create(:tutorial) }
  let(:second_tutorial) { create(:tutorial) }

  context 'when index called' do
    it 'returns both tutorials' do
      tutorial = create(:tutorial)
      second_tutorial = create(:tutorial)
      get :index

      expect(assigns(:tutorials)).to eq([tutorial, second_tutorial])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end
end
