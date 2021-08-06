class Attraction < ApplicationRecord
  has_many :safari_attraction
  has_many :safari, through: :safari_attraction
  mount_uploader :image, PhotoUploader
  belongs_to :user
end
