class Client < ApplicationRecord
    has_many :reservations
    has_many :events, through: :reservations  
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
