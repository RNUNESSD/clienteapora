class Role < ActiveRecord::Base
  #attr_accessible :name, :permission_ids

  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions
end
