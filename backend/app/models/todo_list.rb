class TodoList < ActiveRecord::Base
  has_many :todo_items, -> { order(id: :asc) }, dependent: :destroy

  validates :name, presence: true
end