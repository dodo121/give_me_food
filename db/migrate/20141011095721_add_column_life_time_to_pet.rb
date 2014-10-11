class AddColumnLifeTimeToPet < ActiveRecord::Migration
  def change
    add_column :pets, :life_time, :integer
  end
end
