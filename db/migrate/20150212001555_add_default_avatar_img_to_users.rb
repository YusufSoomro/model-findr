class AddDefaultAvatarImgToUsers < ActiveRecord::Migration
  def change
    change_column :users, :avatar_img, :string, default: "http://prancingthroughlife.com/wp-content/uploads/2014/03/na.jpg"
  end
end
