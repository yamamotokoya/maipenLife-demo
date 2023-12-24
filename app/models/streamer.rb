class Streamer < ApplicationRecord
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos 
  validates :name, presence: true
  validates :x_url, presence: true
end
