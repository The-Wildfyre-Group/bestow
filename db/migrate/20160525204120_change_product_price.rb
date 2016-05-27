class ChangeProductPrice < ActiveRecord::Migration[5.0]
  def change
    add_monetize :products, :price
    remove_column :products, :price
  end
end
