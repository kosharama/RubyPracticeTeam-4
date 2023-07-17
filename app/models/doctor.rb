class Doctor < ApplicationRecord
  has_many :meet

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :date_of_birth, presence: true
  validates :specialty, presence: true
  validate :minimum_age_of_18

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def minimum_age_of_18
    return if date_of_birth.blank?

    if date_of_birth + 18.years > Date.current
      errors.add(:date_of_birth, "must be at least 18 years ago")
    end
  end
end
