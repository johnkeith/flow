class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def index
    @admin = Admin.all
  end

  def show
    @admin = Admin.find params[:id]
  end

  def create
    @admin = Admin.new params[:admin]
    if @admin.save
      redirect_to admins_path
    else
      render :action => 'new'
    end
  end

  def edit
    @admin = Admin.find params[:id]
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

end
