class AddShortMessageToCelebrations < ActiveRecord::Migration[7.1]
  def change
    add_column :celebrations, :short_message, :string
  end
end
