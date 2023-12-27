class Streamer < ApplicationRecord
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos 
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :x_url, presence: true
end
