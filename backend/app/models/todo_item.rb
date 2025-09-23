class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :task, presence: true
  validates :done, inclusion: { in: [true, false] }

  scope :done, -> { where(completed: true) }
  scope :open, -> { where(completed: false) }
end