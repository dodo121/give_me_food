class Pet < ActiveRecord::Base
  
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_create :calculate_life_time
  
  def calculate_life_time
    self.life_time = (Date.today - self.date_of_birth).to_i
  end
end
