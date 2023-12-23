class StreamersController < ApplicationController
  require 'aws-sdk-s3'

  def index
    @streamers = Streamer.all
    render json: ActiveModel::Serializer::CollectionSerializer.new(@streamers, serializer: StreamerSerializer).to_json
  end

  def new
    @streamer = Streamer.new
    @streamer.videos.build
  end

  def create
    @streamer = Streamer.new(streamer_params)
    @streamer.save
    redirect_to streamers_path
  end

  def edit 
    @streamer = Streamer.find(params[:id])
  end

  def update
    @streamer = Streamer.find(params[:id])
    @streamer.update(streamer_params)
    redirect_to all_streamers_path
  end

  def all_streamers 
    @streamers = Streamer.all
  end

  private
   def streamer_params
    params.require(:streamer).permit(:name, :x_url, videos_attributes: [:video_url, :content])
   end
end
