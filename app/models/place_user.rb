class PlaceUser < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates_uniqueness_of :user, scope: :place
end
