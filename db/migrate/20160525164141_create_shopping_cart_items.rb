class CreateShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id       # Holds the owner id, for polymorphism
      t.integer :quantity       # Holds the quantity of the object
      t.integer :product_id        # Holds the object id
      t.integer :price_cents, default: 0, null: false  # Holds the price of the item
      t.string  :price_currency, default: "USD", null: false # Holds the currency for the price
    end
  end
end
