class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.integer :user_id
      t.timestamp
    end

    add_index :products, :user_id
  end
end
