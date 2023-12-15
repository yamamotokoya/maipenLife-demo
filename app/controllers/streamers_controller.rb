class StreamersController < ApplicationController
  require 'aws-sdk-s3'

  def index
    region = 'ap-northeast-1'
    # credentials = Aws::Credentials.new(
    #   ENV['AWS_ACCESS_KEY'],
    #   ENV['AWS_SECRET_ACCESS_KEY']
    # )
    # client = Aws::S3::Client.new(region: region, credentials:credentials)
    # obj = client.get_object(bucket: 'maipenlife-demo-bucket', key: 'uploads/streamer/video/3/sample2.mp4')
    # @file = obj.public_url

    @streamers = Streamer.all
    render json: ActiveModel::Serializer::CollectionSerializer.new(@streamers, serializer: StreamerSerializer).to_json
    @streamer = Streamer.last
  end

  def new
    @streamer = Streamer.new
  end

  def create
    @streamer = Streamer.new(streamer_params)
    @streamer.save
    redirect_to streamers_path
  end

  private
   def streamer_params
    params.require(:streamer).permit(:name, :x_url)
   end
end
