class RemoveLifeTimeFromPet < ActiveRecord::Migration
  def change
    remove_column :pets, :life_time, :integer
  end
end
