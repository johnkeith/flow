class Api::V1::ApplicationController < ActionController::Base
  def test
    render json: { name: 'John' }
  end
end