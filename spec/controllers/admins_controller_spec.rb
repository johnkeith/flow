require 'rails_helper'

RSpec.describe Api::V1::AdminsController, type: :controller do

  describe "GET" do
    before do
      get :show, id: admin.id
    end

    let(:admin) {Admin.create(name: 'Test Admin') }

    it "returns http success" do
      expect(response).to have_http_success(:success)
    end

    # it "resonds with JSON body containing expected Admin attributes" do
    #   hash_body = nil
    #   expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
    #   expect(hash.body).to match({
    #     id: admin.id,
    #     name: 'Test Admin'
    #     })
    # end
  end
end
