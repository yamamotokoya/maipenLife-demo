class Streamer < ApplicationRecord
  mount_uploader :video, VideoUploader
  validates :name, presence: true
  validates :x_url, presence: true
  validates :video, presence: true
end
