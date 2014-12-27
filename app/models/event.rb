class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates :title, :pet_id, presence: true
end
