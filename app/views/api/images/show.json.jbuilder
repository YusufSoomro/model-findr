json.extract! @image, :user_id, :img_url, :caption
json.image_likes do
  json.array! @image.image_likes
end
