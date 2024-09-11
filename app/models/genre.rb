class Genre < ApplicationRecord
  has_many :video_genre_relations, dependent: :destroy
  has_many :videos, through: :video_genre_relationns
end
