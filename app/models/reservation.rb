class Reservation < ApplicationRecord

  belongs_to :client
  belongs_to :event
  accepts_nested_attributes_for :event, :reject_if => :all_blank
  validates :start_time, :end_time, presence: true, uniqueness: true
  validate :reservation_date_cannot_be_in_the_past
  validate :reservation_end_date_must_be_later_than_start_time

  scope :order_by_start_time, -> {order('start_time asc')}

  def reservation_date_cannot_be_in_the_past
    if start_time.present? && start_time < Date.today
      errors.add(:start_time, "can't be in the past")
    end
  end

  def reservation_end_date_must_be_later_than_start_time
    if end_time.present? && end_time <= start_time
      errors.add(:end_time, "cannot be before/equal to start time")
    end
  end
end
