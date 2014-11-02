class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.date :date_of_birth

      t.timestamps
    end
  end
end
