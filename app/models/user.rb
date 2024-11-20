class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :profile_image, ProfileImageUploader

  validates :name,     presence: true
  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :bio,      presence: true
end
