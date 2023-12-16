class VideosController < ApplicationController
  def index
    videos = Video.all 
    render json: videos, each_serializer: VideoSerializer
  end
end
