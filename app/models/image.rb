class Image < ActiveRecord::Base
  validates :user_id, :img_url, presence: true

  belongs_to :user

  has_many :image_likes
end
