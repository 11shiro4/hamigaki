class BrushingLog < ApplicationRecord
  validates :kid_nickname, presence: true
  validates :date, presence: true
  validates :time_of_day, presence: true, inclusion: { in: 0..23 }
  validates :brushed_at, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :kid
end
