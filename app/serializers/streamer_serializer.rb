class StreamerSerializer < ActiveModel::Serializer
  attributes :id, :name, :x_url
  has_many :videos, serializer: VideoSerializer
end

class VideoSerializer < ActiveModel::Serializer
  attribute :video_url
end
