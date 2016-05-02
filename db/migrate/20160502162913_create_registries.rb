class CreateRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :registries do |t|
      t.integer :user_id
      t.string :title
    end

    add_index :registries, :user_id
  end
end
