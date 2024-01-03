class Streamer < ApplicationRecord
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos 
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :x_url, presence: true

  scope :search, ->(word) do
    where("name LIKE ?", "%#{word}%").
    or(where("x_url LIKE ?", "%#{word}%")).
    or(where("content LIKE ?", "%#{word}%"))
  end
  scope :videos_join, -> { joins(:videos) }
  scope :column_select, -> { select('streamers.name, streamers.x_url, streamers.avatar, videos.video_url, videos.content')}

  scope :free_word_search, ->(word) do
    videos_join.search(word).column_select
  end
end
