class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validates :image, presence: true

  mount_uploader :image, DefaultUploader
end
