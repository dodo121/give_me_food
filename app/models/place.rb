class Place < ActiveRecord::Base
  
  has_many :place_users
  has_many :users, through: :place_users
  
  def visited? (user)
    if self.users.find_by id: user
      return true
    else
      return false
    end
  end
end
