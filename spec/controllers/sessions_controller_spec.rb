require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:my_user) { create(:user) }

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST sessions' do
    it 'returns http success' do
      post :create, params: { session: { email: my_user.email } }
      expect(response).to have_http_status(:success)
    end

    it 'initalizes a session' do
      post :create, params: { session: { email: my_user.email, password: my_user.password }}
      expect(session[:user_id]).to eq my_user.id
    end

    it 'does not add a user id to session due to missing password' do
      post :create, params: { session: { email: my_user.email } }
      expect(session[:user_id]).to be_nil
    end

    it 'flashes #error with bad email address' do
      post :create, params: { session: { email: 'does not exits' } }
      expect(response).to render_template :new
    end

    it 'renders #new with bad email address' do
      post :create, params: { session: { email: 'does not exist' } }
      expect(response).to render_template :new
    end

    it 'redirects to the root view' do
      post :create, params: { session: { email: my_user.email, password: my_user.password } }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DELETE sessions/id' do
    it 'render the #welcome view' do
      delete :destroy, params: { id: my_user.id }
      expect(response).to redirect_to root_path
    end

    it "deletes the user's session" do
      delete :destroy, params: { id: my_user.id }
      expect(assigns(:session)).to be_nil
    end

    it 'flashes #notice' do
      delete :destroy, params: { id: my_user.id }
      expect(flash[:notice]).to be_present
    end
  end
end
