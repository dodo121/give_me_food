class Pet < ActiveRecord::Base
  
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true
  
  def life_time
    (Date.today - date_of_birth).to_i
  end
end
