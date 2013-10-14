class ArticleCategory < ActiveRecord::Base
  attr_accessible :name, :is_active

  has_many :articles

  validates :name, presence: :true, uniqueness: true

  def self.active
    where(is_active: true)
  end
end
