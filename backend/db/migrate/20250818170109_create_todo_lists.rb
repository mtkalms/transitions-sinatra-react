# frozen_string_literal: true

# Creates table todo_lists with name and description
class CreateTodoLists < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_lists do |t|
      t.string :name, limit: 30, null: false
      t.text :description
    end
  end
end
