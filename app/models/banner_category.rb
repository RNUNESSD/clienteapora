class BannerCategory < ActiveRecord::Base
  attr_accessible :name, :is_active, :banners_attributes, :image_width, :image_height

  has_many :banners, inverse_of: :banner_category

  validates_associated :banners

  attr_readonly :name

  validates :name, presence: :true, uniqueness: true
  validates :image_width, presence: true, numericality: true
  validates :image_height, presence: true, numericality: true

  accepts_nested_attributes_for :banners, allow_destroy: true, reject_if: :all_blank
end
