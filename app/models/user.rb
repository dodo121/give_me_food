class User < ActiveRecord::Base
  
  has_many :pets
  has_many :events
  has_many :place_users
  has_many :places, through: :place_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
