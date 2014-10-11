class RemoveColumnLifeTimeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :life_time, :integer
  end
end
