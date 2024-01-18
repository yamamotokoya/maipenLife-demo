class ApiController < ApplicationController
  protect_from_forgery

  def return_streamers_videos 
    @streamer = Streamer.find(params[:id])
    @videos = @streamer.videos

    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @videos, 
      serializer: VideoSerializer
    ).to_json
  end

  def return_videos 
    @videos = Video.all 

    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @videos,
      serializer: VideoSerializer
    ).to_json
  end

  def return_search_result 
    word = params[:word]
    @data = Video.free_word_search(word)
    render json: @data
  end
end
