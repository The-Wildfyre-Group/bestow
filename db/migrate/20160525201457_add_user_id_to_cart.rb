class AddUserIdToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :user_id, :integer
    add_index :carts, :user_id, unique: true
  end
end
