require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      pending
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      pending
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      pending
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
