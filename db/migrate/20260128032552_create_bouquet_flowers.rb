class CreateBouquetFlowers < ActiveRecord::Migration[7.1]
  def change
    create_table :bouquet_flowers do |t|
      t.references :flower, null: false, foreign_key: true
      t.references :bouquet, null: false, foreign_key: true
      t.integer :count, null: false, default: 1

      t.timestamps
    end
    add_index :bouquet_flowers, [:bouquet_id, :flower_id], unique: true
  end
end
