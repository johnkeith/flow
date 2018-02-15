
RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET #index' do
  it 'returns successfully' do
    get :index, format: :json
    expect(response.status).to eq 200
  end

  it "returns all the admins" do
   admin = FactoryBot.create_list(:admin, 10)
   get :index, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eql(10)
    end
  end
end
