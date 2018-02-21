require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do
  let(:account) { FactoryBot.create(:account) }
  let(:admin) { FactoryBot.create(:admin, account: account) }

  before do
    account
    admin
  end

  context 'GET #index' do
    before do
      get :index
    end
    
    it 'returns successfully' do
      expect(response.status).to eq 200
    end

    it "returns all the admins" do
      json = JSON.parse(response.body)
      
      expect(json.length).to eql(Admin.all.length)
    end
  end

  context 'GET #show' do
    before do 
      get :show, params: { id: admin.id } 
    end

    it 'returns successfully' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to_not be_nil
    end
  end

  context 'POST #create' do
    it 'returns successfully' do        
      post :create, params: { 
        admin: { 
          name: 'Bill Murray',
          account_id: account.id 
        } 
      }, format: :json
      
      expect(response).to have_http_status(:ok)
    end

    it 'raises an ActiveRecord error when invalid' do
      expect { post :create, params: {
        admin: {
          account_id: account.id
        }
      }, format: :json }.to raise_error ActiveRecord::NotNullViolation
    end
  end

  describe 'PUT #update' do
    it 'should update successfully' do
      put :update, params: { 
        id: admin.id,
        admin: {
          name: 'changed by update' 
        } 
      }, format: :json
      
      expect(response).to have_http_status(:ok)
    end
  end
end
