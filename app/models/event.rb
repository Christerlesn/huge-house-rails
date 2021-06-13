class Event < ApplicationRecord
    has_many :vendors
    has_many :reservations, :dependent => :destroy
    has_many :clients, through: :reservations
    validates :title, presence: true
    validates :description, presence: true
end
