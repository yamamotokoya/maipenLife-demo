class Video < ApplicationRecord
  mount_uploader :video_url, VideoUploader
  belongs_to :streamer
end
