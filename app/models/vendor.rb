class Vendor < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :type, presence: true
  validates :description, presence: true

end
