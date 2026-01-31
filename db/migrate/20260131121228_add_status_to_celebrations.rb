class AddStatusToCelebrations < ActiveRecord::Migration[7.1]
  def change
    add_column :celebrations, :status, :integer
  end
end
