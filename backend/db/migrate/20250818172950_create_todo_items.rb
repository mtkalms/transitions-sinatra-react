class CreateTodoItems < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_items do |t|
      t.integer :todo_list_id
      t.string :task, limit: 30, null: false
      t.boolean :done, null: false, default: false
    end
  end
end
