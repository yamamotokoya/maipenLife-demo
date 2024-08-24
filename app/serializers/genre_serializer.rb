class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :video_genre_relations
  has_many :videos, through: :video_genre_relations

end
