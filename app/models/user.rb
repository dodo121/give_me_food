class User < ActiveRecord::Base

  attr_accessor :login

  validates :username, uniqueness: true

  has_many :pets, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :place_users, dependent: :destroy
  has_many :places, through: :place_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# TODO make premium renew || extendable
  def make_premium(month_number)
    self.premium_expiry_date = Time.now + month_number.to_i.months
    self.save
  end

  def has_premium_account?
    premium_expiry_date != nil && premium_expiry_date > Time.now
  end

  private

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
     where(conditions).first
    end
  end

end
