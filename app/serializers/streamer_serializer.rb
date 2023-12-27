class StreamerSerializer < ActiveModel::Serializer
  attributes :id, :name, :x_url, :avatar
  has_many :videos
end

