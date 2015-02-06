class Image < ActiveRecord::Base
  validates :user_id, :img_url, :user_city, presence: true

  belongs_to :user

  has_many :image_likes
end
