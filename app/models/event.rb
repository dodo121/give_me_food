class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates_presence_of :title
  validates_presence_of :pet_id
end
