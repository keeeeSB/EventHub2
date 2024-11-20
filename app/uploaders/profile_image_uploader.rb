class ProfileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # 保存先の指定
  storage :file

  # アップロード画像のリサイズ
  version :thumb do
    process resize_to_fit: [100, 100]
  end

  # アップロード可能な拡張子の制限
  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
