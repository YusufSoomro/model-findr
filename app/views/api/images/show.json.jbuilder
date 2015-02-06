json.extract! @image, :id, :user_id, :img_url, :caption, :user_city
json.image_likes do
  json.array! @image.image_likes
end
