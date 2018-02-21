class Api::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    user = Admin.find_by(email: authentication_params[:email])
    
    if user.authenticate(authentication_params[:password])
      token = user.encode
      
      render json: { token: token }
    else
      render json: Authentication::Errors::UnauthorizedError.new,
        status: :unauthorized
    end
  end

  private
  
  def authentication_params
    params.require(:authentication).permit(:email, :password)
  end
end