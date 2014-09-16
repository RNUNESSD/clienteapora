class ArticleCategory < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  validates :name, presence: :true, uniqueness: true

  scope :active, -> { where(is_active: true) }
end
