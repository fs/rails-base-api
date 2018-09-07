class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
