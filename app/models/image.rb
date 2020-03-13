class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item, required: true

  validates :image, presence: true
end
