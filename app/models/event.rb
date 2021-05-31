class Event < ApplicationRecord
    has_many :vendors
    has_many :reservations
    has_many :clients, through: :reservations  
end
