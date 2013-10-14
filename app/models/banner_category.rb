class BannerCategory < ActiveRecord::Base
  attr_accessible :name, :is_active, :banners_attributes

  has_many :banners

  attr_readonly :name

  validates :name, presence: :true, uniqueness: true

  accepts_nested_attributes_for :banners, allow_destroy: true
end
