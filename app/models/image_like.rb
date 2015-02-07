class ImageLike < ActiveRecord::Base
  validates :image_id, :liker_id, presence: true
  validates :image_id, uniqueness: { scope: :liker_id }

  belongs_to :image
  belongs_to :user, foreign_key: :liker_id, class_name: "User"
end
