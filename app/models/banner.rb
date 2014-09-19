# encoding: UTF-8
class Banner < ActiveRecord::Base
  stringify :expires_at, format: '%d/%m/%Y %H:%M:%S'

  belongs_to :banner_category, inverse_of: :banners

  validates :image, presence: :true
  validates :banner_category, presence: true

  mount_uploader :image, BannerUploader
end
