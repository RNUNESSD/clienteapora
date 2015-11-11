class Localization < ActiveRecord::Base
	validates :address, presence: true

	mount_uploader :image, DefaultUploader
end
