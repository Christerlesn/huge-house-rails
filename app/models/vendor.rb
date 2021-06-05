class Vendor < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :vendor_type, presence: true
  validates :description, presence: true

end
