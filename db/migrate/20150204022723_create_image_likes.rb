class CreateImageLikes < ActiveRecord::Migration
  def change
    create_table :image_likes do |t|
      t.integer :image_id, null: false, index: true
      t.integer :liker_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
