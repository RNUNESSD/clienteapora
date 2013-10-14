class Image < ActiveRecord::Base
  attr_accessible :image, :title

  belongs_to :imageable, polymorphic: true

  validates :image, presence: true

  mount_uploader :image, DefaultUploader
end
