class Pet < ActiveRecord::Base
  before_create :calculate_life_time
  
  belongs_to :user
  has_many :events

  def calculate_life_time
    self.life_time = (Date.today - self.date_of_birth).to_i
  end
end
