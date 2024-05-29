class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video_url, :streamer_id, :content
  belongs_to :streamer
  has_many :likes
end
