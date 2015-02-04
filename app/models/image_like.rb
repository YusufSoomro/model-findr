class ImageLike < ActiveRecord::Base
  validates :image_id, :liker_id, presence: true

  belongs_to :image
end
