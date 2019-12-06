class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process convert: "png"
  process tags: ["post_picture"]
  process resize_to_fit: [200, 200]

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  version :thumbnail do
    process resize_to_fill: [50, 50]
  end

  version :thumb do
    process resize_to_fill: [900, 400]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url
    ActionController::Base.helpers.asset_path("food-default.png")
  end

  def size_range
    0..5.megabytes
  end
end
