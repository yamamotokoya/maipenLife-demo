class VideosController < ApplicationController

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
    @video = Video.find(params[:id])
  end

  def edit 
    @video = Video.find(params[:id])
  end

  def update 
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to edit_streamer_path(@video.streamer_id)
  end

  def destroy 
    @video = Video.find(params[:id])
    @video.delete 
    redirect_to request.referer
  end

  private 
    def video_params
      params.require(:video).permit(:video_url, :content, :streamer_id)
    end
end
