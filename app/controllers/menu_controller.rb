class MenuController < ApplicationController
  before_action :check_permission
  
  def index 
  end

  private 

  def check_permission
    redirect_to new_login_path unless session[:permission]
  end
end
