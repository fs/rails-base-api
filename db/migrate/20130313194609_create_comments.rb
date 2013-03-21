class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :text
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
