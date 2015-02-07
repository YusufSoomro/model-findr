json.array! @images do |image|
  json.extract! image, :id, :user_id, :img_url, :caption, :user_city
  json.liked image.liked_by_user?(@current_user)
  json.author_username image.user.username
end
