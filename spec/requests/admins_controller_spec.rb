require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do
  # initialize test data
  let!(:admin_list) { create_list(:admin, 10) }
  let!(:account) { create(:account) }


  describe 'GET #index' do
    before { get :index }
  it 'returns successfully' do
    expect(response.status).to eq 200
  end

  it "returns all the admins" do
      json = JSON.parse(response.body)
      expect(json.length).to eql(10)
    end
  end

  describe 'GET #show' do
    before { FactoryBot.create(:admin, id: 1) }
    before { get :show, params: { id: 1 } }
    it 'returns successfully' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to_not be_nil
    end
  end

  describe 'POST #create' do
    context 'admin is created' do
      it 'returns successfully' do
        post :create, params: FactoryBot.attributes_for(:admin, :account_id => Account.first.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'admin creation is invalidated' do
      it 'raises an ActiveRecord error' do
        expect {
          post :create, params: FactoryBot.attributes_for(:admin)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end


end
