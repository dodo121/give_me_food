class CreatePlaceUsers < ActiveRecord::Migration
  def change
    create_table :place_users do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
