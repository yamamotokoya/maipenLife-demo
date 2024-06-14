class UsersController < ApplicationController

  def create 
    if session[:user_id]

      redirect_to likes_path 

    else

      user = User.create 

      session[:user_id] = user.id
      
      redirect_to likes_path 

    end
  end  
end
