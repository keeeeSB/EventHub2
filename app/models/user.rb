class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :name,     presence: true
  validates :email,    presence: true, uniquness: true
  validates :password, presence: true
  validates :bio,      presence: true
end
