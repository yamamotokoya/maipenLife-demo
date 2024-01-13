module SecoundLoginHelper

  def admin_login(admin_user) 
    session[:admin_user_id] = admin_user.id
  end

  def admin_loggedin?
     !current_user.nil?
  end

  def current_user
    if session[:admin_user_id]
      @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end 

  def root_admin_user?
    current_user.root_admin?
  end

  def admin_user? 
    current_user.admin?
  end

  def redirect_after_loggedin 
    if root_admin_user?
      redirect_to root_admin_users_path 
    else
      redirec_to all_streamers_path
    end
  end
end
