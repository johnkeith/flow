module Authentication
  def authenticate_user
    unless current_user.present?
      render json: Errors::UnauthorizedError, status: 401 
    end
  end

  def current_user
    admin_from_token if auth_token_present?      
  end

  private

  def auth_token_present?
    request
      .env
      .fetch("HTTP_AUTHORIZATION", "")
      .scan(/Bearer/)
      .flatten
      .first
      .present?
  end

  def admin_from_token
    decoded = Authenticatable.decode(token)
    
    Admin.where(id: decoded.first['user_id']).first
  end

  def token
    request
      .env["HTTP_AUTHORIZATION"]
      .scan(/Bearer (.*)$/)
      .flatten
      .last
  end

  module Errors
    class UnauthorizedError < StandardError
      def initialize(msg='Unauthroized request')
        super
      end
    end
  end
end