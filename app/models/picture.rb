class Picture < ApplicationRecord
  validates :content, presence: true

  # association
  belongs_to :user

  # image_up_lodaer
  mount_uploader :image, ImageUploader

end
