class AddPetToEvent < ActiveRecord::Migration
  def change
    add_column :events, :pet_id, :integer
  end
end
