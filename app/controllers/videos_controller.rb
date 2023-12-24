class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all 
    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @videos,
      serializer: VideoSerializer
    ).to_json
  end

  def new
    @video = Video.new
    @streamer_id = params[:id]
  end

  def create 
    @video = Video.new(video_params)
    @video.save
    redirect_to all_streamers_path
  end

  def show 
  end

  def edit 
  end

  def update 
    @video.update(video_params)
    redirect_to edit_streamer_path(@video.streamer_id)
  end

  def destroy 
    @video.delete 
    redirect_to request.referer
  end

  private 
    def video_params
      params.require(:video).permit(:video_url, :content, :streamer_id)
    end

    def set_video 
      @video = Video.find(params[:id])
    end
end
