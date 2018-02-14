require "rails_helper"

RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET #index' do
  admin = FactoryBot.create(:admin)
  it "returns all the admins" do
    get :index
      admins = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(admin["name"]).to eq admin.name
      expect(admin["id"]).to eq admin.id
      expect(admin["account_id"]).to eq admin.account_id
      expect(admin["created_at"]).to eq admin.created_at
      expect(admin["updated_at"]).to eq admin.updated_at
    end
  end
end
