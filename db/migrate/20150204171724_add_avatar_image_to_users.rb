class AddAvatarImageToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :avatar_img, :string)
  end
end
