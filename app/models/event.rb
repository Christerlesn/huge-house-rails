class Event < ApplicationRecord
    has_many :vendors, :dependent => :destroy
    has_many :reservations, :dependent => :destroy
    has_many :clients, through: :reservations
    validates :title, presence: true
    validates :description, presence: true
end
