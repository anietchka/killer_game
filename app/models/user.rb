class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :confirmable, 
          :recoverable, :validatable, :jwt_authenticatable, 
          jwt_revocation_strategy: self
  has_many :games
  has_many :players

end
