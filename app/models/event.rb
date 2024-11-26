class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :category

  validates :title,       presence: true
  validates :description, presence: true
  validates :start_time,  presence: true
  validates :location,    presence: true

  # 開催前のイベント
  scope :upcoming, -> { where("start_time > ?", Time.current).order(start_time: :asc) }
  # 開催後のイベント
  scope :past, -> { where("start_time <= ?", Time.current).order(start_time: :desc) }
end
