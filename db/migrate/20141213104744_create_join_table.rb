class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :places do |t|
      t.index :user_id
      t.index :place_id
    end
  end
end
