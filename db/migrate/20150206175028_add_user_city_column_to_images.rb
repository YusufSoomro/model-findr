class AddUserCityColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_city, :string
    add_index :images, :user_city
  end
end
