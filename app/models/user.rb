class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :name, presence: true, uniqueness: true

    # Use :name instead of :email for authentication
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if name = conditions.delete(:name)
        where(conditions.to_h).where([ "lower(name) = :value", { value: name.downcase } ]).first
      else
        where(conditions.to_h).first
      end
    end
end
