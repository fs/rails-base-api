class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.text :text

      t.timestamps null: false
    end
  end
end
