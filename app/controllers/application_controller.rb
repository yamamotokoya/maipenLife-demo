class ApplicationController < ActionController::Base
  include SecoundLoginHelper

  def check_permission
    redirect_to new_login_path unless session[:permission]
  end

end
