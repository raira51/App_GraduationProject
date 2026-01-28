class CreateBouquets < ActiveRecord::Migration[7.1]
  def change
    create_table :bouquets do |t|
    t.references :celebration, null: false, foreign_key: true, index: { unique: true }
    
    t.timestamps
    end
  end
end
