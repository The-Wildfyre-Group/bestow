class CreateProductsRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :registry_products do |t|
      t.integer :product_id
      t.integer :registry_id
    end

    add_index :registry_products, :product_id
    add_index :registry_products, :registry_id
  end
end
