class Image < ApplicationRecord
  attr_accessor :image
  mount_uploader :image, ImageUploader,

  :mount_on => :image

  belongs_to :user


end
