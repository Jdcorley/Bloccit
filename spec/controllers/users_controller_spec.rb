require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
      name: "BlocHead",
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end
  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'instantiates a new user' do
      get :new
      expect(assigns(:user)).not_to be_nil
    end
  end
  describe 'POST create' do
    it 'returns an http redirect' do
      post :create, params: { user: :new_user_attributes }
      expect(response).to have_http_status(:redirect)
    end

    it 'creates a new user' do
      expect{
        post :create, params: { user: :new_user_attributes }
      }.to change(User, :count).by(1)
    end

    it 'sets user name properly' do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    it 'sets user email properly' do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    it 'sets user password properly' do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    it 'sets user password_confirmation properly' do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password_confirmation).to eq :new_user_attributes[:password_confirmation]
    end

    it 'logs the user in after sign up' do
      post :create, params: { user: new_user_attributes }
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end
  
  describe "not signed in" do 
    let(:factory_user) {create(:user) }

    before do 
      post :create, params: { user: new_user_attributes }
    end 

    it "returns http success" do 
      get :show, params: { id: factory_user.id }
      expect(response).to have_http_status(:success)
    end 

    it "renders the #show view" do 
      get :show, params: { id: factory_user.id }
      expect(response).to render_template :show 
    end 

    it "assigns factory_user to @user" do 
      get :show, params: { id: factory_user.id }
      expect(assigns(:user)).to eq(factory_user)
    end 
  end 
end
