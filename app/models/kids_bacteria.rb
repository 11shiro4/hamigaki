class KidsBacteria < ApplicationRecord
  validates :kid_nickname, presence: true
  validates :bacteria_id, presence: true
  validates :status, inclusion: { in: [true, false] }

  belongs_to :kid
  belongs_to :bacterium
end