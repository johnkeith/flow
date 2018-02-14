require "rails_helper"

RSpec.describe Api::V1::AdminsController, type: :controller do
  describe 'GET #index' do
  admin = FactoryBot.create(:admin)
  subject { get :index }
    it { is_expected.to have_http_status(:ok) }
    it 'will return records' do
      expect(JSON.parse(subject.body)).to eql(
        [{
         "id"=> admin.id,
         "name"=> "test admin",
         "account_id"=> admin.account_id ,
         "created_at"=> Time.current,
         "updated_at"=> Time.current,
        }])
    end
  end

end
