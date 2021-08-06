class Hotel < ApplicationRecord
  has_many :safari_hotel
  has_many :hotels, through: :safari_hotel
  mount_uploader :image, PhotoUploader
  belongs_to :user
end
