class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :state
      t.string :password_digest
      t.string :reset_password_token
      t.boolean :admin
      t.string :authentication_token
      t.datetime :reset_password_sent_at
      t.timestamps
    end
  end
end
