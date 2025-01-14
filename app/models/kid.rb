class Kid < ApplicationRecord
  after_initialize :set_default_values, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :brushing_logs
  has_many :kids_bacteria
  has_many :bacteria, through: :kids_bacteria

  private

  def set_default_values
    self.daily_login_count ||= 0
  end
end
