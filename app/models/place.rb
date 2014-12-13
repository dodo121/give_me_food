class Place < ActiveRecord::Base
  has_and_belongs_to_many :users, through: :places_users
  
  def visited(user)
    if self.users.find_by id: user
      return 'Visited'
    else
      return 'Not visited'
    end
  end
end
