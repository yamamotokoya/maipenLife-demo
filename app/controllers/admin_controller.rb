class AdminController < ApplicationController
  before_action :check_root_admin
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index 
  end

  def show 
  end
  
  def new 
    @admin = Admin.new 
  end

  def create 
    @admin = Admin.new(admin_params)
    @admin.admin = true 
    if @admin.save 
      redirect_to root_admin_users_path
    else
      render :new
    end
  end
  
  def edit 
  end

  def update 
    @admin.update(admin_params)
    redirec_to root_admin_users_path
  end

  def destroy 
    @admin.destroy 
    redirec_to root_admin_users_path
  end

  private 

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def check_root_admin
    redirec_to request.referer unless root_admin? 
  end

  def set_id 
    @admin = Admin.find(params[:id])
  end
end
