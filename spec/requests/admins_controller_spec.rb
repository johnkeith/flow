require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET #index' do
  it 'returns successfully' do
    get :index, format: :json
    expect(response.status).to eq 200
  end

  it "returns all the admins" do
   FactoryBot.create_list(:admin, 10)
   get :index
      json = JSON.parse(response.body)
      expect(json.length).to eql(10)
    end
  end

  describe 'GET #show' do
    it 'returns successfully' do
      FactoryBot.create(:admin, id: 1)
      get :show, params: {id: 1}
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to_not be_nil
    end
  end

  describe 'POST #create' do
    context 'admin is created' do
      it 'returns successfully' do
        random_id = rand(1000)
        FactoryBot.create(:account, id: random_id)
        post :create, params: { name: 'fake name', account_id: random_id }
        expect(response.status).to eq 200
      end
    end
    context 'admin is not created' do

    end
  end

end
