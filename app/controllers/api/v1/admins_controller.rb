class Api::V1::AdminsController < ApplicationController

  def index
    @admin = Admin.all
  end

  def show
    @admin = Admin.find params[:id]
  end

  def create
    @admin = Admin.new params(admin_params)
    if @admin.save
      redirect_to admins_path
    else
      render :action => 'new'
    end
  end


  def update
    @admin = Admin.find params[:id]
    if @admin.update_attributes params[:id]
      redirect_to admins_path
    else
      render :action => :edit
    end
  end

  def destroy
    @admin = Admin.find params[:id]
    @admin.destroy
    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :account_id)
  end

end
