# encoding: UTF-8
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :title, :abstract, :formated_published_at, :published_at, :content, :images_attributes

  has_many :images, as: :imageable

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true

  def formated_published_at
    published_at.strftime("%d/%m/%Y %H:%I:%S") unless published_at.blank?
  end

  def formated_published_at=(formated)
    self.published_at = Time.parse(formated) unless formated.nil?
  rescue ArgumentError
    @formated_published_at_invalid = true
  end

  def validate
    errors.add(:formated_published_at, "Data Inválida") if @formated_published_at_invalid
  end
end
