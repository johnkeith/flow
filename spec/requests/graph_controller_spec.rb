require 'rails_helper'

RSpec.describe Api::V1::GraphController, type: :controller do
  let(:account) { FactoryBot.create(:account) }
  let(:admin) { FactoryBot.create(:admin, account: account) }
  let(:admin_two) { FactoryBot.create(:admin, account: account) }
  let(:admins_graph) {
    {
      account: {
        only: [:id],
        admins: {
          only: [:id]
        },
        surveys: {
          except: [:id],
          survey_responses: {}
        }
      }
    }
  }

  before do
    account
    admin
    admin_two

    authenticate(admin)
  end

  context '#index' do
    it 'should return successfully with a valid graph' do
      get :index, params: { m: 'admin', g: admins_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
      expect(json.first['account'].keys.length).to eq(3)
    end

    it 'should accept page and per headers' do
      request.headers['HTTP_PAGE'] = 2
      request.headers['HTTP_PER_PAGE'] = 1

      get :index, params: { m: 'admin', g: admins_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end
  end

  context '#show' do
    it 'should return successfully with a valid graph and id' do
      get :show, params: { id: admin.id, m: 'admin', g: admins_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json['id']).to eq(admin.id)
      expect(json['name']).to eq(admin.name)
      expect(json['account']).to be_present
    end
  end

  context '#create' do
    it 'should return unsuccessfully with invalid params' do
      post :create, params: { 
        m: 'admin',
        admin: {
          name: 'Joe',
        }
      }

      json = JSON.parse(response.body)
      expect(json['id']).not_to be_present
      expect(json['errors']).to be_present
    end
    
    it 'should return successfully with valid model and params' do 
      post :create, params: { 
        m: 'admin',
        admin: {
          name: 'Joe',
          email: 'joe@example.com',
          password: 'Asdf123!',
          password_confirmation: 'Asdf123!'
        }
      }

      json = JSON.parse(response.body)
      expect(json['id']).to be_present
      expect(json['account_id']).to eq(admin.account_id)
    end
  end

  context '#update' do
    it 'should return successfully with valid model and params' do 
      post :update, params: { 
        m: 'admin',
        id: admin.id,
        admin: {
          name: 'NewJoe'
        }
      }

      json = JSON.parse(response.body)
      expect(json['id']).to be_present
      expect(json['name']).to eq('NewJoe')
      expect(json['name']).not_to eq(admin.name)
    end
  end
end