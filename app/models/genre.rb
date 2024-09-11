class Genre < ApplicationRecord
  has_many :video_genre_relations 
  has_many :videos, through: :video_genre_relationns, dependent: :destroy 
end
