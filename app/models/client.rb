class Client < ApplicationRecord
    has_many :reservations
    has_many :events, through: :reservations  
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    scope :most_active_client, -> {left_joins(:reservations).group(:event_id).order('min(event_id) desc')}

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => auth_hash['info']['nickname']).first_or_create do |client|
      client.first_name = auth_hash['info']['name']
      client.email = auth_hash['info']['urls']['GitHub']
      client.password = SecureRandom.hex
    end
  end

end