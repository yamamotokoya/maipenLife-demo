class AdminUsersController < ApplicationController
  before_action :check_root_admin
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index 
    @admins = AdminUser.where.not(root_admin: true)
  end

  def show 
  end
  
  def new 
    @admin = AdminUser.new 
  end

  def create 
    @admin = AdminUser.new(admin_params)
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
    params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_root_admin
    redirec_to request.referer unless root_admin_user? 
  end

  def set_id 
    @admin = AdminUser.find(params[:id])
  end
end
