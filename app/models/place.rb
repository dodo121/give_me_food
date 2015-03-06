class Place < ActiveRecord::Base

  has_many :place_users
  has_many :users, through: :place_users

  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, country].compact.join(', ')
  end

  def visited? (user)
    if self.users.find_by id: user
      return true
    else
      return false
    end
  end
end
