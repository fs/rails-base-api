class AddStatusToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :status, :integer, default: 0
  end
end
