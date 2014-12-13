class CreatePlacesUsers < ActiveRecord::Migration
  def change
    create_table :places_users do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
