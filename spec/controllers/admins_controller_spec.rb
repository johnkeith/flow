require "rails_helper"

RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET /api/v1/admins' do

  let!(:admin) { create(:admin) }
  subject { get :index }

  it { is_expected.to have_http_status(:ok) }

    it 'will return records' do
      expect(subject.body).to eql({
        "data" => [{
          "id"=>"1",
          }]
        })
    end

    context 'When you have 100 records' do

    end
  end
end
