class LikesController < ApplicationController
  protect_from_forgery 

  def create 

    user = session[:user_id] ? User.find(session[:user_id]) : User.create 

    like = Like.new(like_params)
    like.user_id = user.id

    if like.save 
      render json: {data: like}
    else 
      render json: {data: like.errors}
    end

  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: {status: "success"}
  end

  private 
  
  def like_params
    params.permit(:video_id)
  end
  
end
