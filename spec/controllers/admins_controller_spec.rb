require "rails_helper"

RSpec.describe Api::V1::AdminsController, type: :controller do

  describe 'GET /api/v1/admins' do
  let(:admin) { build(:admin) }
  subject { get :index }
    it { is_expected.to have_http_status(:ok) }
    it 'will return records' do
      expect(JSON.parse(subject.body)).to eql([])
    end
  end

  describe 'GET #show' do
    admin = FactoryBot.build(:admin)
    subject { get :show, id: admin.id }
    it { is_expected.to have_http_status(:ok) }
  end

  context 'admin name validation' do
    let(:admin) { build(:admin) }
      it 'ensures only admins with names are saved' do
        admin.name = ''
      expect(admin.save).to eql(false)
    end
  end

end
