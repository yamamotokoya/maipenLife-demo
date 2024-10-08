class Video < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  belongs_to :streamer
  has_many :likes, dependent: :destroy 
  has_many :video_genre_relations, dependent: :destroy
  has_many :genres, through: :video_genre_relations

  scope :search, ->(word) do
    where("name LIKE ?", "%#{word}%").
    or(where("x_url LIKE ?", "%#{word}%")).
    or(where("content LIKE ?", "%#{word}%"))
  end

  scope :streamer_joins, -> {joins(:streamer) }

  scope :free_word_search, ->(word) do
    streamer_joins.search(word)
  end

end
