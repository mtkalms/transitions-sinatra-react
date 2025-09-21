# frozen_string_literal: true

# Creates table users with name, email and password
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
