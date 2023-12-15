class Streamer < ApplicationRecord
  has_many :videos
  validates :name, presence: true
  validates :x_url, presence: true
end
