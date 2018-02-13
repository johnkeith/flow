class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only [:show, :uptdate, :destroy]

  def index
    @admin = Admin.all
    json_response (@admin)
  end

  def show
    json_response(@admin)
  end

  def create
    @admin = Admin.create!(admin_params)
    json_response(@admin)
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
