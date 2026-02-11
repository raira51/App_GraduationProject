class AddBackgroundTypeToCelebrations < ActiveRecord::Migration[7.1]
  def change
    add_column :celebrations, :background_type, :string
  end
end
