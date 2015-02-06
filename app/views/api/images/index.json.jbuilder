json.array! @images do |image|
  json.extract! image, :id, :user_id, :img_url, :caption, :user_city
end
