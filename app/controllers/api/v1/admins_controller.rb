class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :uptdate, :destroy]

  def index
    @admin = Admin.all
    render json: @admin
  end

  def show
    render json: @admin
  end

  def create
    @admin = Admin.create!(admin_params)
    render json: @admin
  end


  def update
    @admin.update(admin_params)
    head :no_content
  end

  def destroy
    @admin.destroy
    head :no_content
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :account_id)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
