class CreateLetters < ActiveRecord::Migration[7.1]
  def change
    create_table :letters do |t|
      t.string :sender_name, null: false
      t.text :body, null: false
      t.references :celebration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
