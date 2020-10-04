class AddUserRefToLabels < ActiveRecord::Migration[5.2]
  def change
    add_references :labels, :user, foreign_key: true
  end
end
