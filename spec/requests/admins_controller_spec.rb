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
        @valid_admin = FactoryBot.build(:admin)
        post :create, params:
          { admin:
            { name: @valid_admin.name, account_id: @valid_admin.account_id } },
            format: :json
        expect(response).to have_http_status(:ok)
      end
    end

     context 'admin creation is invalidated' do
       it 'raises an ActiveRecord error' do
         @invalid_admin = FactoryBot.build(:admin)
         expect {
         post :create, params:
           { name: @invalid_admin.name, account_id: @invalid_admin.account_id },
           format: :json }.to raise_error(ActionController::ParameterMissing)
       end
     end
  end

  describe 'PATCH #update' do
    patch :update, params:
      { id: @admin.id, admin:
        { name: 'changed by update'} }, format: :json
    it { should respond_with 200 }
  end


end
