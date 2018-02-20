require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do
  # initialize test data
  before(:each) { @admin = FactoryBot.create(:account) }
  before(:each) { @account = FactoryBot.create(:admin) }


  describe 'GET #index' do
    before { get :index }
  it 'returns successfully' do
    expect(response.status).to eq 200
  end

  it "returns all the admins" do
      json = JSON.parse(response.body)
      expect(json.length).to eql(Admin.all.length)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: Admin.first } }
    it 'returns successfully' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to_not be_nil
    end
  end

  describe 'POST #create' do
    context 'admin is created' do
      it 'returns successfully' do
        post :create, params: {:admin => @admin, :account_id => Account.first.id}
        expect(response).to have_http_status(:ok)
      end
    end
  end

  #   context 'admin creation is invalidated' do
  #     it 'raises an ActiveRecord error' do
  #       expect {
  #         post :create, params: FactoryBot.attributes_for(:admin)
  #       }.to raise_error(ActiveRecord::RecordInvalid)
  #     end
  #   end
  # end
  #
  # describe 'PATCH #update' do
  #   context 'when it is successfully updated' do
  #     before(:each) do
  #
  #       put :update, :params => { id: @admin.id, admin: { name: "New Name" } }
  #     end
  #     it "renders the json representation for the updated admin" do
  #       admin_response = JSON.parse(response.body, symbolize_names: true)
  #       expect(admin_response[:name]).to eql "New Name"
  #     end
  #   end
  # end


end
