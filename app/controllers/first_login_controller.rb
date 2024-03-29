class FirstLoginController < ApplicationController

  def create 
    password = params[:password]

    if login?(password)
      redirect_to new_secound_login_path
    else
      render :new
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
