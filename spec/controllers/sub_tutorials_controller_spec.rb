require 'rails_helper'

RSpec.describe SubTutorialsController, type: :controller do
  let(:sub_tutorial) { create(:sub_tutorial) }
  let(:second_tutorial) { create(:sub_tutorial) }
  let(:new_title) { 'A New Title' }

  context 'when #index called with anonymous user' do
    it 'returns both tutorials' do
      login_with nil
      get :index

      expect(assigns(:sub_tutorials)).to eq([sub_tutorial, second_tutorial])
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

      expect(response).to redirect_to(sub_tutorials_path)
    end
  end

  context 'when #new called as an admin' do
    it 'displays the new view' do
      login_with create(:user, :admin)
      get :new

      expect(assigns(:sub_tutorial)).to be_a_new(SubTutorial)
    end
  end

  context 'when #create called' do
    it 'creates a new sub_tutorial' do
      login_with create(:user, :admin)
      tutorial_params = FactoryBot.attributes_for(:sub_tutorial)

      expect { post :create, sub_tutorial: tutorial_params }
        .to change(SubTutorial, :count).by(1)
    end
  end

  context 'when #edit called' do
    it 'allows the sub_tutorial to be edited' do
      login_with create(:user, :admin)
      get :edit, id: sub_tutorial.id

      expect(assigns(:sub_tutorial)).to eq sub_tutorial
    end

    it 'redirects to edit_tutorial_path' do
      login_with create(:user, :admin)
      get :edit, id: sub_tutorial.id

      expect(response).to render_template('edit')
    end
  end

  it 'blocks editing with standard_user' do
    login_with create(:user, :standard_user)
    get :edit, id: sub_tutorial.id

    expect(response).to redirect_to(sub_tutorials_path)
  end

  context 'when #show successfully called' do
    it 'shows the correct sub_tutorial' do
      login_with create(:user, :standard_user)
      get :show, id: sub_tutorial.id

      expect(assigns(:sub_tutorial)).to eq sub_tutorial
    end

    it 'renders the correct template' do
      login_with create(:user, :standard_user)
      get :show, id: sub_tutorial.id

      expect(response).to render_template('show')
    end
  end

  context 'when #update successfully called' do
    it 'updates sub_tutorial' do
      login_with create(:user, :admin)
      put :update, sub_tutorial: { title: new_title }, id: sub_tutorial.id

      expect(SubTutorial.first.title).to eq new_title
    end
  end

  context 'when #destroy called' do
    let!(:sub_tutorial) { create(:sub_tutorial) }

    it 'updates the correct sub_tutorial' do
      login_with create(:user, :admin)
      delete :destroy, id: sub_tutorial.id

      expect(response).to redirect_to(sub_tutorials_path)
      expect(SubTutorial.count).to eq 0
    end
  end
end
