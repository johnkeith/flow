module Authentication
  def authenticate_user
    render_unauthorized unless current_user.present?       
  end

  def current_user
    admin_from_token if auth_token_present?      
  end

  def current_account_id
    current_user.account_id if current_user.present?
  end

  def request_authorized_for_resource?(resource)
    if resource.is_a?(Account)
      resource.id.eql?(current_account_id)
    else
      resource.account_id.present? &&
      resource.account_id.eql?(current_account_id)
    end
  end

  def render_unauthorized
    render json: Errors::UnauthorizedError, status: 401
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
    if @_admin_from_token
      @_admin_from_token
    else
      decoded = Authenticatable.decode(token)
    
      @_admin_from_token = Admin.where(id: decoded.first['user_id']).first
    end
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

      def to_json(_)
        { message: message }.to_json
      end
    end
  end
end