class User < ApplicationRecord
  has_secure_password

  has_many :meet
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness:true , on:create
  validates :birth_date, presence: true
  validate :minimum_age_of_18
  validate :valid_phone_number

  private

  def minimum_age_of_18
    return if birth_date.blank?

    if birth_date + 18.years > Date.current
      errors.add(:birth_date, "must be at least 18 years ago")
    end
  end

  def valid_phone_number
    return if phone.blank?

    unless Phonelib.valid_for_country?(phone, "UA")
      errors.add(:phone, "is invalid")
    end
  end
end
