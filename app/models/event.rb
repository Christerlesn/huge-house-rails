class Event < ApplicationRecord
    has_many :vendors
    has_many :reservations
    has_many :clients, through: :reservations
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
end
