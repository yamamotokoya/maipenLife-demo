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

  private 
    def video_params
      params.require(:video).permit(:video_url, :content, :streamer_id)
    end
end
