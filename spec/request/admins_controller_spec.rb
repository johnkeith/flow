require "rails_helper"

RSpec.describe "AdminsController", type: :request do
  describe 'GET /api/v1/admins' do
    it 'will return records' do
      get '/api/v1/admins'

    end
  end
end
