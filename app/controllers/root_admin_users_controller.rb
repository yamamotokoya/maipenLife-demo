class RootAdminUsersController < ApplicationController

  def index 
  end

  def new 
    @admin = AdminUser.new
  end
  
  def create 
    @admin = AdminUser.new(root_admin_user_params)

    @admin.admin = true 
    @admin.root_admin = true

    if @root_admin.save
      redirect_to root_path
    else
      redirect_to root_path 
    end
  end

  def destroy 
    if admin_loggedin? 
      logout
      redirect_to new_first_login_path
    end
  end

  private 

  def root_admin_user_params 
    params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
  end
end
