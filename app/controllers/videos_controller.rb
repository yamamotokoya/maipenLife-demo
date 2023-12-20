class VideosController < ApplicationController
  def index
    @videos = Video.all 
    render json: ActiveModel::Serializer::CollectionSerializer.new(
      @videos,
      serializer: VideoSerializer
    ).to_json
  end
end
