# encoding: UTF-8
class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  stringify :published_at

  has_many :images, as: :imageable

  belongs_to :article_category

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true

  private
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
