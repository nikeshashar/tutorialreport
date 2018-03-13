require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do
  let(:tutorial) { create(:tutorial) }
  let(:second_tutorial) { create(:tutorial) }
  let(:new_title) { 'A New Title' }

  context 'when #index called with anonymous user' do
    it 'returns both tutorials' do
      login_with nil
      get :index

      expect(assigns(:tutorials)).to eq([tutorial, second_tutorial])
    end

    it 'renders the #index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  context 'when #new called as a user' do
    it 'redirects to tutorials_path' do
      login_with create(:user, :standard_user)
      get :new

      expect(response).to redirect_to(tutorials_path)
    end
  end

  context 'when #new called as an admin' do
    it 'displays the new view' do
      login_with create(:user, :admin)
      get :new

      expect(assigns(:tutorial)).to be_a_new(Tutorial)
    end
  end

  context 'when #create called' do
    it 'creates a new tutorial' do
      login_with create(:user, :admin)
      tutorial_params = FactoryBot.attributes_for(:tutorial)

      expect { post :create, tutorial: tutorial_params }
        .to change(Tutorial, :count).by(1)
    end
  end

  context 'when #edit called' do
    it 'allows the tutorial to be edited' do
      login_with create(:user, :admin)
      get :edit, id: tutorial.id

      expect(assigns(:tutorial)).to eq tutorial
    end

    it 'redirects to edit_tutorial_path' do
      login_with create(:user, :admin)
      get :edit, id: tutorial.id

      expect(response).to render_template('edit')
    end
  end

  it 'blocks editing with standard_user' do
    login_with create(:user, :standard_user)
    get :edit, id: tutorial.id

    expect(response).to redirect_to(tutorials_path)
  end

  context 'when #show successfully called' do
    it 'shows the correct tutorial' do
      login_with create(:user, :standard_user)
      get :show, id: tutorial.id

      expect(assigns(:tutorial)).to eq tutorial
    end

    it 'renders the correct template' do
      login_with create(:user, :standard_user)
      get :show, id: tutorial.id

      expect(response).to render_template('show')
    end
  end

  context 'when #update successfully called' do
    it 'updates tutorial' do
      login_with create(:user, :admin)
      put :update, tutorial: { title: new_title }, id: tutorial.id

      expect(Tutorial.first.title).to eq new_title
    end
  end
end
