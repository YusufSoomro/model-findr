class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id, null: false, index: true
      t.string :img_url, null: false, index: true
      t.string :caption

      t.timestamps null: false
    end
  end
end
