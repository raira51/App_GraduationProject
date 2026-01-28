class CreateCelebrations < ActiveRecord::Migration[7.1]
  def change
    create_table :celebrations do |t|
      t.string :title, null: false
      t.string :giver_name, null: false
      t.string :receiver_name, null: false
      t.date :celebration_date
      t.string :share_url, null: false
      t.references :user, null: false, foreign_key: true
      t.string :view_password_digest
      t.boolean :is_accepting_letters, null: false, default: true

      t.timestamps
    end
    add_index :celebrations, :share_url, unique: true
  end
end
