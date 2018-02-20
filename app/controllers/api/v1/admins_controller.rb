class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :uptdate, :destroy]
  protect_from_forgery with: :null_session

  def index
    @admin = Admin.all
    render json: @admin
  end

  def show
    render json: @admin
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity 
    end
  end


  def update
    if @admin.update_attributes(admin_params)
      render json: @admin, status: :ok
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @admin.destroy
      render json: :no_content, status: :no_content
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :account_id)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
