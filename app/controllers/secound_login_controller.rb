class SecoundLoginController < ApplicationController
  before_action :check_permission
  
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:email])

    if admin_user && admin_user.authenticate(params[:password]) && admin_user.root_admin?

      admin_login(admin_user)
      current_user
      redirect_after_loggedin

    else

      render :new

    end
  end

  private 

  def check_permission
    redirect_to new_first_login_path unless session[:permission]
  end

end
