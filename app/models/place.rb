class Place < ActiveRecord::Base
  has_and_belongs_to_many :users, through: :users_places
end
