class ChangeItemBelongAssoc < ActiveRecord::Migration[5.0]
  def change
    remove_column :cart_items, :cart_id
    add_column :cart_items, :owner_id, :integer
    add_column :cart_items, :owner_type, :string

    add_index :cart_items, :owner_id
    add_index :cart_items, :owner_type
  end
end
