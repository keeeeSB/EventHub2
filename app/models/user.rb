class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :profile_image, ProfileImageUploader

  validates :name,             presence: true
  validates :email,            presence: true, uniquness: true
  validates :crypted_password, presence: true
  validates :bio,              presence: true
end
