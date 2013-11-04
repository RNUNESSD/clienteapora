# encoding: UTF-8
class Banner < ActiveRecord::Base
  attr_accessible :image, :link, :expires_at, :formated_expires_at

  belongs_to :banner_category, inverse_of: :banners

  after_save :recreate_image_versions

  validates :image, presence: :true
  validates :banner_category, presence: true

  def formated_expires_at
    expires_at.strftime("%d/%m/%Y %H:%I:%S") unless expires_at.blank?
  end

  def formated_expires_at=(formated)
    self.expires_at = Time.parse(formated) unless formated.blank?
  rescue ArgumentError
    @formated_expires_at_invalid = true
  end

  def validate
    errors.add(:formated_expires_at, "Data Inválida") if @formated_expires_at_invalid
  end

  mount_uploader :image, BannerUploader

  private
  def recreate_image_versions
    image.recreate_versions!
  end
end
