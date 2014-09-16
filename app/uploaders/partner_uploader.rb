# encoding: utf-8
class PartnerUploader < BaseUploader
  include CarrierWave::MiniMagick

  version :partner do
    process :resize_to_fill => [209, 60]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
