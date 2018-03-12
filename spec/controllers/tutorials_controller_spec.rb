require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do
  let(:tutorial) { create(:tutorial) }
  let(:second_tutorial) { create(:tutorial) }

  context 'when index called with anonymous user' do
    it 'returns both tutorials' do
      login_with nil
      get :index

      expect(assigns(:tutorials)).to eq([tutorial, second_tutorial])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  context 'when new called as a user' do
    it 'redirects to tutorials_path' do
      login_with create(:user, :standard_user)
      get :new

      expect(response).to redirect_to(tutorials_path)
    end
  end

  context 'when new called as an admin' do
    it 'displays the new view' do
      login_with create(:user, :admin)
      get :new

      expect(assigns(:tutorial)).to be_a_new(Tutorial)
    end
  end
end
