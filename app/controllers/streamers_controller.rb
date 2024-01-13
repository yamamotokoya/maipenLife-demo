class StreamersController < ApplicationController
  before_action :check_admin, except: :show

  def index 
  end
  
  def new
    @streamer = Streamer.new
    @streamer.videos.build
  end

  def create
    @streamer = Streamer.new(streamer_params)

    @streamer.save
    redirect_to root_path
  end

  def show 
    @streamer = Streamer.find(params[:id])
    @videos = @streamer.videos

    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @videos, 
      serializer: VideoSerializer
    ).to_json
  end

  def edit
    @streamer = Streamer.find(params[:id])
  end

  def update
    @streamer = Streamer.find(params[:id])
    @streamer.update(streamer_params)

    redirect_to all_streamers_path
  end

  def destroy
    @streamer = Streamer.find(params[:id])
    @streamer.destroy 

    redirect_to request.referer
  end
  
  def all_streamers 
    @streamers = Streamer.all
  end

  private
   def streamer_params
    params.require(:streamer).permit(:name, :x_url, :avatar, videos_attributes: [:video_url, :content])
   end

   def check_admin
    redirect_to request.referer unless admin_user?
   end
end
