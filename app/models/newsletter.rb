class Newsletter < ActiveRecord::Base
  #attr_accessible :name, :email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true#, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i }
end
