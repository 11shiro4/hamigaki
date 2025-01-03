class Bacteria < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :kids_bacteria
  has_many :kids, through: :kids_bacteria
end