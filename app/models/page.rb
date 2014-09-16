class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  #attr_accessible :title, :abstract, :content, :images_attributes

  attr_readonly :title

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true
end
