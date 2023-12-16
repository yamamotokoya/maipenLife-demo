class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video_url, :streamer_id
  belongs_to :streamer
end
