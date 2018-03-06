require 'rails_helper'

RSpec.describe Api::V1::GraphController, type: :controller do
  let(:account) { FactoryBot.create(:account) }
  let(:admin) { FactoryBot.create(:admin, account: account) }
  let(:admin_two) { FactoryBot.create(:admin, account: account) }
  let(:graph) {
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
    before do
      get :index, params: { graph: graph.to_json, format: :json }
    end

    it 'should return successfully with a valid graph' do
      json = JSON.parse(response.body)
      expect(json.first.keys.size).to eq(3)
    end
  end
end