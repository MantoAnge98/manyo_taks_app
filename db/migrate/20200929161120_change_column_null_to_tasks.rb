class ChangeColumnNullToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :date, null: true
    change_column :tasks, :name, :string, null: true
    change_column :tasks, :detail, :text, null: true
    change_column :tasks, :status, :integer, null: true
    change_column :tasks, :priority, :integer, null: true
  end
end
