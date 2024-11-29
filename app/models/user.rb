class User < ApplicationRecord
  attr_accessor :actiation_token
  before_save   :downcase_email
  before_create :create_ctivation_token
  authenticates_with_sorcery!
  mount_uploader :profile_image, ProfileImageUploader

  has_many :events,    dependent: :destroy
  has_many :joins,     dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name,     presence: true
  validates :email,    presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :bio,      presence: true

  private

    def downcase_email
      self.email = email.downcase
    end

    def create_activation_token
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
