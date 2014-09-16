class Newsletter < ActiveRecord::Base
  #attr_accessible :name, :email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
end
