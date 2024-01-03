class Video < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  belongs_to :streamer

  scope :search, ->(word) do
    where("content LIKE ?", "%#{word}%")
  end
end
