# frozen_string_literal: true

# Model offer
class Offer < ApplicationRecord
  validates :company, presence: true
  validates :advertiser_name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :url, presence: true, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/ix  }
  validates :starts_at, presence: true
  validate :ends_after_starts_at?, if: -> { ends_at && starts_at }

  enum status: %i[disabled enabled]

  scope :enabled, -> {
    where(status: 'enabled')
      .where(':date BETWEEN starts_at AND ends_at OR starts_at < :date AND ends_at is NULL', date: Time.zone.now)
  }

  private

  def ends_after_starts_at?
    return if ends_at > starts_at

    errors.add :end_date, 'must be after start date'
  end
end
