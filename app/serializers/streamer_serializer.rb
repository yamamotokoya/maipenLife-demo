class StreamerSerializer < ActiveModel::Serializer
  attributes :id, :name, :x_url
  has_many :videos
end

