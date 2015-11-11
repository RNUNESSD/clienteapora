class Phone < ActiveRecord::Base
	validates :phone, presence: true
end
