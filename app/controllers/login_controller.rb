class LoginController < ApplicationController

  def create 
    password = params[:password]

    if login?(password)
      redirect_to menu_path
    else
      render :new
    end
  end

  def destroy 
    if session[:permission] === true 
      session[:permission] = nil
      redirect_to new_login_path  
    end
  end

  private 

  def login?(password)
    login(password)
  end

  def login(password)
    if ENV['ROOT_PATH'] === password
      session[:permission] = true
    else
      session[:permission] = false
    end
  end
  
end
