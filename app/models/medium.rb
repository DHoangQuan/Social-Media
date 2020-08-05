class Medium < ApplicationRecord
  mount_uploader :link_medium, MediaUploader
  belongs_to :post
  has_many :comments
  has_many :likes
end
