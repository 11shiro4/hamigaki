class BrushingLog < ApplicationRecord
  validates :kid_nickname, presence: true
  validates :date, presence: true
  validates :time_of_day, presence: true, inclusion: { in: 0..23 }

  belongs_to :kid
end