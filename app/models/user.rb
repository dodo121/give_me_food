class User < ActiveRecord::Base
  
  attr_accessor :login
  
  validates :username, uniqueness: true
  
  has_many :pets
  has_many :events
  has_many :place_users
  has_many :places, through: :place_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
     where(conditions).first
    end
  end
end