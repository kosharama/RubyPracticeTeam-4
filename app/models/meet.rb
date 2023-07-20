class Meet < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates :doctor_id, presence: true
  validates :user_id, presence: true
  validates :appointment_date_time, presence: true
  validate :appointment_uniqueness_for_doctor
  validate :appointment_must_be_in_future

  private

  def appointment_uniqueness_for_doctor
    return if doctor_id.blank? || appointment_date_time.blank?

    if Meet.exists?(doctor_id: doctor_id, appointment_date_time: appointment_date_time)
      errors.add(:appointment_date_time, "has already been scheduled for this doctor")
    end
  end

  def appointment_must_be_in_future
    return if appointment_date_time.blank?

    if appointment_date_time < Time.now
      errors.add(:appointment_date_time, "cannot be in the past")
    end
  end

end