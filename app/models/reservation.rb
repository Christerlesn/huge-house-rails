class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :event
  # accepts_nested_attributes_for :event, :reject_if => :all_blank
end
