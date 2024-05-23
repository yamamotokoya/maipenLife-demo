class LikesController < ApplicationController

  def create 
    like = Like.new(like_params)

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
    params.require(:like).permit(:video_id)
  end
  
end
