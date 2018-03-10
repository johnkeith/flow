require 'rails_helper'

RSpec.describe Api::V1::GraphController, type: :controller do
  let(:account) { FactoryBot.create(:account) }
  let(:admin) { FactoryBot.create(:admin, account: account) }
  let(:admin_two) { FactoryBot.create(:admin, account: account) }
  let(:accounts_graph) {
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

  let(:admins_graph) {
    {
      admin: {
        account: {}
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
      get :index, params: { g: accounts_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json.first.keys.size).to eq(3)
    end

    it 'should accept page and per headers' do
      request.headers['HTTP_PAGE'] = 2
      request.headers['HTTP_PER_PAGE'] = 1

      get :index, params: { g: admins_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end
  end

  context '#show' do
    it 'should return successfully with a valid graph and id' do
      get :show, params: { id: admin.id, g: admins_graph.to_json, format: :json }

      json = JSON.parse(response.body)
      expect(json['id']).to eq(admin.id)
      expect(json['name']).to eq(admin.name)
      expect(json['account']).to be_present
    end
  end
end