class Kid < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :brushing_logs
  has_many :kids_bacteria
  has_many :bacteria, through: :kids_bacteria
end