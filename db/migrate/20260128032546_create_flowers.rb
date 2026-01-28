class CreateFlowers < ActiveRecord::Migration[7.1]
  def change
    create_table :flowers do |t|
      t.string :name, null: false
      t.string :description
      t.string :word, null: false

      t.timestamps
    end
  end
end
