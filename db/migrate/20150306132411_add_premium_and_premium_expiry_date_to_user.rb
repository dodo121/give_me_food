class AddPremiumAndPremiumExpiryDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :premium, :boolean
    add_column :users, :premium_expiry_date, :datetime
  end
end
