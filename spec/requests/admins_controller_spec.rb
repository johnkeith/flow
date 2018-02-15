require "rails_helper"

RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET #index' do
  admin = FactoryBot.create(:admin)
  it "returns all the admins" do
   get :index
      json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json.length).to eql(Admin.last.id)
    end
  end
end
