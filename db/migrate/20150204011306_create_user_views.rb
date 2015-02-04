class CreateUserViews < ActiveRecord::Migration
  def change
    create_table :user_views do |t|
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
