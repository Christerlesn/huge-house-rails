class Client < ApplicationRecord
    has_many :reservations
    has_many :events, through: :reservations  
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    def self.create_by_github_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
    
        end
    end
end
