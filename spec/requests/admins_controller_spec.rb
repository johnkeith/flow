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
    end
  end

end
