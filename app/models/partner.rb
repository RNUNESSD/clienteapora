class Partner < ActiveRecord::Base
	validates :image, presence: true
	validates :name, presence: true
	mount_uploader :image, DefaultUploader
end
